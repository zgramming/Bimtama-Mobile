import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../injection.dart';
import '../../../router.dart';
import '../../model/model/user_model.dart';
import '../../utils/utils.dart';
import '../widgets/modal_error.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(userNotifier.notifier).loadUser());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<UserModel?>>(
      userNotifier.select((value) => value.onLoad),
      (previous, next) {
        next.when(
          data: (data) {
            final group = data?.data.appGroupUser.code;
            redirectHome(
              data,
              whenUnauthorized: () => context.goNamed(routeLogin),
              onForbiddenUserGrup: () => showSnackbar(
                context,
                text: Text("Usergroup $group tidak tersedia"),
                color: Colors.red,
              ),
              saveSession: () => ref.read(userNotifier.notifier).setUser(data!),
              whenDosen: () => context.goNamed(routeDosenHome),
              whenMahasiswa: () => context.goNamed(routeMahasiswaHome),
            );
          },
          error: (error, stackTrace) {
            showDialog(
              context: context,
              builder: (context) => ModalErrorWidget(message: error.toString()),
            );
          },
          loading: () => log("Loading ..."),
        );
      },
    );

    return const Scaffold(
      backgroundColor: primary,
      body: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

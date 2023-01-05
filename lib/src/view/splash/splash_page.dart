import 'dart:developer';

import 'package:bimtama/router.dart';
import 'package:bimtama/src/model/model/user_model.dart';
import 'package:bimtama/src/utils/utils.dart';
import 'package:bimtama/src/view_model/widgets/modal_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../injection.dart';

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
            if (data == null) {
              context.goNamed(routeLogin);
              return;
            }

            context.goNamed(routeHome);
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

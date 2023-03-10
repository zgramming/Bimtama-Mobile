import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../injection.dart';
import '../../../router.dart';
import '../../model/datasource/authentication_remote_datasource.dart';
import '../../model/model/user_model.dart';
import '../../utils/utils.dart';
import '../widgets/form_body.dart';

class _UserGroupType {
  final String code;
  final String name;
  _UserGroupType({
    required this.code,
    required this.name,
  });
}

final _userGroups = <_UserGroupType>[
  _UserGroupType(code: "mahasiswa", name: "Mahasiswa"),
  _UserGroupType(code: "dosen", name: "Dosen"),
];

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  bool isObsecure = true;
  _UserGroupType? selectedUserGroup;

  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<UserModel?>>(
      authenticationNotifier.select((value) => value.onRegister),
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
              saveSession: () {
                ref.read(userNotifier.notifier).setUser(data!);
                showSnackbar(
                  context,
                  text: const Text("Berhasil Registrasi"),
                  color: Colors.green,
                );
              },
              whenDosen: () => context.goNamed(routeDosenHome),
              whenMahasiswa: () => context.goNamed(routeMahasiswaHome),
            );
          },
          error: (error, stackTrace) => showSnackbar(
            context,
            text: Text("$error"),
            color: Colors.red,
          ),
          loading: () => showSnackbar(
            context,
            text: const Text("Loading"),
            color: secondary,
            duration: const Duration(days: 365),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register User"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormBody(
                        title: "User Group",
                        child: DropdownButtonFormField<_UserGroupType>(
                          value: selectedUserGroup,
                          isExpanded: true,
                          decoration: inputDecorationRounded(),
                          items: _userGroups
                              .map(
                                (val) => DropdownMenuItem(
                                  value: val,
                                  child: Text(val.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) return;

                            setState(() => selectedUserGroup = value);
                          },
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      FormBody(
                        title: "Username",
                        child: TextFormField(
                          controller: usernameController,
                          decoration: inputDecorationRounded(),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      FormBody(
                        title: "Password",
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: isObsecure,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: inputDecorationRounded().copyWith(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObsecure = !isObsecure;
                                });
                              },
                              icon: Icon(
                                isObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  final firebaseToken = await firebaseMessaging.generateToken();
                  final form = RegisterFormModel(
                    username: usernameController.text,
                    codeGroup: selectedUserGroup?.code ?? "",
                    password: passwordController.text,
                    token: firebaseToken ?? "",
                  );
                  await ref
                      .read(authenticationNotifier.notifier)
                      .register(form);
                },
                style: elevatedButtonStyle(),
                child: Text(
                  "Register",
                  style: bodyFontBold.copyWith(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

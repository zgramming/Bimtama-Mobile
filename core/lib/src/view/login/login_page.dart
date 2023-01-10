import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../injection.dart';
import '../../../router.dart';
import '../../model/model/user_model.dart';
import '../widgets/form_body.dart';
import '../../utils/utils.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool isObsecure = true;
  bool isLoading = false;

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
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<UserModel?>>(
      authenticationNotifier.select((value) => value.onLogin),
      (previous, next) {
        next.when(
          data: (data) {
            final group = data?.data.appGroupUser.code;
            redirectHome(
              data,
              onForbiddenUserGrup: () => showSnackbar(
                context,
                text: Text("Usergroup $group tidak tersedia"),
                color: Colors.red,
              ),
              saveSession: () {
                ref.read(userNotifier.notifier).setUser(data!);
                showSnackbar(
                  context,
                  text: const Text("Berhasil login"),
                  color: Colors.green,
                );
              },
              whenUnauthorized: () => context.goNamed(routeLogin),
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
            text: const Text("Loading..."),
            color: secondary,
            duration: const Duration(days: 365),
          ),
        );
      },
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: statusBarHeight(context) + 8.0),
          constraints: BoxConstraints(
            minHeight: h(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Form Login",
                        textAlign: TextAlign.center,
                        style: bodyFontBold.copyWith(fontSize: 20.0),
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
                              icon: Icon(isObsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () async {
                          await ref.read(authenticationNotifier.notifier).login(
                                username: usernameController.text,
                                password: passwordController.text,
                              );
                        },
                        style:
                            elevatedButtonStyle(backgroundColor: Colors.blue),
                        child: Text(
                          "LOGIN",
                          style: bodyFontBold.copyWith(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      OutlinedButton(
                        onPressed: () {
                          context.pushNamed(routeRegister);
                        },
                        style: outlineButtonStyle(),
                        child: Text(
                          "REGISTER",
                          style: bodyFontBold.copyWith(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

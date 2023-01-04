// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bimtama/injection.dart';
import 'package:bimtama/router.dart';
import 'package:bimtama/src/model/model/login_response_model.dart';
import 'package:bimtama/src/utils/colors.dart';
import 'package:bimtama/src/utils/functions.dart';
import 'package:bimtama/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'package:bimtama/src/utils/fonts.dart';
import 'package:bimtama/src/utils/sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/form_body.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool isObsecure = true;

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
    ref.listen<AsyncValue<LoginData?>>(
      authenticationNotifier.select((value) => value.onLogin),
      (previous, next) {
        next.when(
          data: (data) => showSnackbar(
            context,
            text: Text("Success"),
            color: Colors.green,
          ),
          error: (error, stackTrace) => showSnackbar(
            context,
            text: Text("$error"),
            color: Colors.red,
          ),
          loading: () => showSnackbar(
            context,
            text: Text("Loading..."),
            color: secondary,
          ),
        );
      },
    );
    return AbsorbPointer(
      absorbing: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // color: primary,
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
                            await ref
                                .read(authenticationNotifier.notifier)
                                .login(
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
      ),
    );
  }
}

import 'package:bimtama/router.dart';
import 'package:bimtama/src/model/model/user_model.dart';
import 'package:bimtama/src/utils/colors.dart';
import 'package:bimtama/src/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bimtama/injection.dart';
import 'package:bimtama/src/utils/fonts.dart';
import 'package:bimtama/src/utils/styles.dart';
import 'package:bimtama/src/view_model/widgets/form_body.dart';
import 'package:go_router/go_router.dart';

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
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<UserModel?>>(
        authenticationNotifier.select((value) => value.onRegister),
        (previous, next) {
      next.when(
        data: (data) {
          if (data != null) ref.read(userNotifier.notifier).setUser(data);
          context.goNamed(routeHome);
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
        ),
      );
    });
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
                  await ref.read(authenticationNotifier.notifier).register(
                        username: usernameController.text,
                        password: passwordController.text,
                        codeGroup: selectedUserGroup?.code ?? "",
                      );
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

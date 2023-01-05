import 'package:core/src/model/model/user_model.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

void showSnackbar(
  BuildContext context, {
  required Text text,
  Color? color,
}) {
  final snackbar = SnackBar(
    content: Row(
      children: [
        Expanded(child: text),
        // IconButton(
        //   onPressed: () {
        //     // ScaffoldMessenger.of(context).hideCurrentSnackBar();
        //   },
        //   icon: const Icon(Icons.close, color: Colors.white),
        // )
      ],
    ),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void redirectHome(
  UserModel? user, {
  required VoidCallback onForbiddenUserGrup,
  required VoidCallback saveSession,
  required VoidCallback whenDosen,
  required VoidCallback whenMahasiswa,
  required VoidCallback whenUnauthorized,
}) {
  if (user == null) {
    whenUnauthorized();
    return;
  }

  final codeGroup = user.data.appGroupUser.code;

  if (!availableUserGroup.contains(codeGroup)) {
    onForbiddenUserGrup();
    return;
  }

  saveSession();

  if (codeGroup == "mahasiswa") {
    whenMahasiswa();
    return;
  }

  if (codeGroup == "dosen") {
    whenDosen();
    return;
  }
}

String stringToSlug(String value) {
  final result = value
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'\s{2,}'), ' ')
      .replaceAll(RegExp(r'[^\w\s-]'), '')
      .replaceAll(' ', '-');
  return result;
}

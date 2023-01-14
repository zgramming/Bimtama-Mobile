import 'dart:io';
import 'dart:math';

import 'package:core/core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackbar(
  BuildContext context, {
  required Text text,
  Color? color,
  Duration duration = const Duration(seconds: 5),
}) {
  final snackbar = SnackBar(
    duration: duration,
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

Future<DateTime?> showDateTimePicker(
  BuildContext context, {
  bool withTimePicker = true,
}) async {
  DateTime? date;
  TimeOfDay? time;

  final datePicker = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (datePicker != null) {
    date = datePicker;

    if (withTimePicker) {
      final timePicker = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child ?? const SizedBox(),
          );
        },
      );

      if (timePicker != null) {
        time = timePicker;
      }
    }
  }

  if (withTimePicker) {
    if (date != null && time != null) {
      return date.add(Duration(hours: time.hour, minutes: time.minute));
    }
  } else {
    if (date != null) {
      return date;
    }
  }

  return null;
}

Future<String> openFile(String url) async {
  final uri = Uri.parse(url);

  final canLaunch = await canLaunchUrl(uri);
  if (!canLaunch) {
    throw Exception("Tidak dapat membuka file");
  }
  await launchUrl(uri, mode: LaunchMode.externalApplication);

  return "Berhasil membuka aplikasi";
}

Future<File> pickFile() async {
  final result = await FilePicker.platform.pickFiles(
    dialogTitle: "Pilih file",
    type: FileType.custom,
    allowedExtensions: ["pdf", "doc", "docx"],
  );

  if (result == null) {
    throw Exception("Membatalkan aksi");
  }
  final file = File(result.files.single.path ?? "");
  return file;
}

int generateUniqueIDNotification() {
  final random = Random();
  final id = random.nextInt(1000000000);
  return id;
}

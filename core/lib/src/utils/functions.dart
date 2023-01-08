import 'package:core/core.dart';
import 'package:flutter/material.dart';

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

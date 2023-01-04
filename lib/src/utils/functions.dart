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

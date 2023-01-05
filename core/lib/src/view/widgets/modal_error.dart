import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ModalErrorWidget extends StatelessWidget {
  const ModalErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Terjadi masalah",
        style: bodyFont.copyWith(color: Colors.red),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: bodyFont.copyWith(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

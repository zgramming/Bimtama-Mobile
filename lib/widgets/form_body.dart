import 'package:flutter/material.dart';

import '../src/utils/fonts.dart';

class FormBody extends StatelessWidget {
  const FormBody({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: bodyFont.copyWith(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        child
      ],
    );
  }
}

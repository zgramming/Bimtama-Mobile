import 'package:flutter/material.dart';

import 'colors.dart';

ButtonStyle elevatedButtonStyle({
  Color? backgroundColor,
  EdgeInsetsGeometry? padding,
  BorderRadiusGeometry? radius,
}) =>
    ElevatedButton.styleFrom(
      padding: padding ?? const EdgeInsets.all(16.0),
      backgroundColor: backgroundColor ?? primary,
      shape: RoundedRectangleBorder(
        borderRadius: radius ?? BorderRadius.circular(10.0),
      ),
    );

ButtonStyle outlineButtonStyle({
  Color? backgroundColor,
  EdgeInsetsGeometry? padding,
  BorderRadiusGeometry? radius,
}) =>
    OutlinedButton.styleFrom(
      padding: padding ?? const EdgeInsets.all(16.0),
      // backgroundColor: backgroundColor ?? primary,
      shape: RoundedRectangleBorder(
        borderRadius: radius ?? BorderRadius.circular(10.0),
      ),
    );

InputDecoration inputDecorationRounded({double? radius}) => InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
      ),
    );

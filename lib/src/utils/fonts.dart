import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final headerFont = GoogleFonts.raleway();
final headerFontBold = headerFont.copyWith(fontWeight: FontWeight.bold);

TextTheme bodyFontTheme(TextTheme textTheme) =>
    GoogleFonts.numansTextTheme(textTheme);

final bodyFont = GoogleFonts.numans();
final bodyFontBold = bodyFont.copyWith(fontWeight: FontWeight.bold);

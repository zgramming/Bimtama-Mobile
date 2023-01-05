import 'package:flutter/material.dart';

import '../router.dart';
import 'utils/colors.dart';
import 'utils/fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp.router(
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
      title: 'Bimtama',
      theme: theme.copyWith(
        textTheme: bodyFontTheme(theme.textTheme),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: primary,
        colorScheme: theme.colorScheme.copyWith(
          primary: primary,
          secondary: secondary,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0921AA),
    primary: const Color(0xFF0921AA),
    ), 
  );
}

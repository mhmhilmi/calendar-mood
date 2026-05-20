import 'package:flutter/material.dart';

ThemeData buildBlocalmTheme() {
  const seed = Color(0xFF6E5BD9);

  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFFAF9F6),
    useMaterial3: true,
  );
}


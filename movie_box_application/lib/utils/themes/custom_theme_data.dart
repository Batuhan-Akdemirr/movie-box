import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey.shade600),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green)),
      dividerTheme: const DividerThemeData(color: Colors.grey, thickness: 3),
    );
  }
}

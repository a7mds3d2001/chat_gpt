import 'package:chat_gpt/core/style/app_color.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'custom_font',
  scaffoldBackgroundColor: bg,

  /// APP BAR THEME
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: white),
    titleTextStyle: TextStyle(
      color: white,
      fontSize: 20.0,
      fontFamily: 'custom_font',
      fontWeight: FontWeight.bold,
    ),
    elevation: 2.0,
    titleSpacing: 20.0,
    backgroundColor: bg,
  ),
);

import 'package:flutter/material.dart';

import './types.dart';

abstract class Styles {
  static ThemeData themeData({@required Themes theme}) {
    switch (theme) {
      case Themes.LIGHT:
        return lightTheme;
      case Themes.DARK:
        return darkTheme;
      case Themes.TRUEDARK:
        return trueDarkTheme;
      default:
        throw Exception("should not pass here");
    }
  }

  static ThemeData lightTheme = ThemeData.light();

  static ThemeData darkTheme = ThemeData.dark();

  static ThemeData trueDarkTheme = ThemeData.dark();
}

import 'package:shared_preferences/shared_preferences.dart';

import './types.dart';

class Prefs {
  static const Map<Themes, String> themeToString = {
    Themes.DARK: "Dark",
    Themes.LIGHT: "Light",
    Themes.SYSTEM: "System",
    Themes.TRUEDARK: "True Dark"
  };

  static const Map<String, Themes> stringToTheme = {
    "Dark": Themes.DARK,
    "Light": Themes.LIGHT,
    "System": Themes.SYSTEM,
    "True Dark": Themes.TRUEDARK
  };

  Prefs() {
    if (getTheme() == null) setTheme(Themes.SYSTEM);
  }

  static const THEME_STATUS = "THEMESTATUS";

  setTheme(Themes value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(THEME_STATUS, themeToString[value]);
  }

  Future<Themes> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return stringToTheme[prefs.getString(THEME_STATUS)];
  }
}

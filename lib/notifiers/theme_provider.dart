import 'package:flutter/foundation.dart';

import '../utils/prefs.dart';
import '../utils/types.dart';

class ThemeProvider with ChangeNotifier {
  Prefs prefs = Prefs();
  Themes _theme;

  get theme => _theme;
  set theme(Themes value) {
    _theme = value;
    prefs.setTheme(value);
    notifyListeners();
  }
}

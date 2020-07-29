import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './utils/types.dart';
import './utils/styles.dart';
import './notifiers/theme_provider.dart';
import './ui/screens/Host.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = new ThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.theme = await themeChangeProvider.prefs.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  ThemeData lightThemeOptions(Themes theme) {
    if (theme == Themes.SYSTEM || theme == null) {
      return Styles.lightTheme;
    } else {
      return Styles.themeData(theme: theme);
    }
  }

  ThemeData darkThemeOptions(Themes theme) {
    if (theme == Themes.SYSTEM || theme == null) {
      return Styles.darkTheme;
    } else {
      return Styles.themeData(theme: theme);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeChangeProvider,
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            theme: lightThemeOptions(themeChangeProvider.theme),
            darkTheme: darkThemeOptions(themeChangeProvider.theme),
            home: Host(),
          );
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'EpiFlipboard',
  //     darkTheme: ThemeData.dark(),
  //     theme: ThemeData(
  //       // This makes the visual density adapt to the platform that you run
  //       // the app on. For desktop platforms, the controls will be smaller and
  //       // closer together (more dense) than on mobile platforms.
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     home: Host(),
  //   );
  // }
}

void main() {
  runApp(MyApp());
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_support/screen/home/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Only set portrait orientation for device.

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MainScreen());
  });
}

class MainScreen extends StatefulWidget {
  MainScreen();

  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
//    Widget screen;
//    if (widget.result == null) {
//      screen = BaseWidget(
//        screen: Screens.SIGN_IN,
//        connector: SignInConn(),
//        arguments: [
//          widget.uniqueDevice,
//          widget.language,
//          widget.background,
//        ],
//      );
//    } else {
//      screen = BaseWidget(
//        screen: Screens.HOME,
//        arguments: [
//          widget.result.data,
//          widget.uniqueDevice,
//          widget.background,
////          widget.language
//        ],
//      );
//    }
    return MaterialApp(
//      /// Localization, support english and vietnamese languages
//        localizationsDelegates: [
//          _newLocaleDelegate,
//          GlobalMaterialLocalizations.delegate,
//          GlobalWidgetsLocalizations.delegate,
//        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('vi', ''),
        ],
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

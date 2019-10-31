import 'dart:io';

import 'package:camera_fix_exception/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_support/screen/home/HomeScreen.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  final firstCamera = cameras.first;

  /// Only set portrait orientation for device.

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MainScreen(
      camera: firstCamera,
    ));
  });
}

class MainScreen extends StatefulWidget {
  final camera;

  MainScreen({this.camera});

  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: [
          const Locale('en', ''),
          const Locale('vi', ''),
        ],
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(widget.camera));
  }
}

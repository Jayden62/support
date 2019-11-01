import 'dart:async';
import 'dart:convert';

import 'package:flutter_support/model/Schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtil {
  static const String tempKey = 'temp';

  static void saveTemp(Schedule obj) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(tempKey, json.encode(obj));
  }

//  static void removeSignIn() async {
//    final prefs = await SharedPreferences.getInstance();
//    prefs.remove(tempKey);
//  }

  static Future<dynamic> getTemp() async {
    final prefs = await SharedPreferences.getInstance();
    String strTemp = prefs.getString(tempKey);
    if (strTemp.isEmpty) {
      return null;
    }

    var completer = new Completer();
    completer.complete(Schedule.fromJson(json.decode(strTemp)));
    return completer.future;
  }
}

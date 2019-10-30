import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_support/style/Style.dart';
import 'package:flutter_support/utils/NavigateUtil.dart';

class SelfScreen extends StatefulWidget {
  final String nickName;

  SelfScreen({this.nickName});

  @override
  State<StatefulWidget> createState() => SelfState();
}

class SelfState extends State<SelfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.black26,
            elevation: 0,
          )),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _header(),
          ],
        ),
      ),
    );
  }

  Widget _platform() {
    /**
     * Check platform on user device.
     */
    Widget widget;
    if (Platform.isAndroid) {
      widget = Icon(Icons.arrow_back);
    } else if (Platform.isIOS) {
      widget = Icon(Icons.navigate_before);
    }
    return widget;
  }

  Widget _header() => Container(
        height: appBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                NavigateUtil().popScreen(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: margin10),
                child: _platform(),
              ),
            ),
            Container(
              child: Text(
                'Information Creator',
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: margin10),
                child: Icon(Icons.developer_mode),
              ),
            ),
          ],
        ),
      );
}

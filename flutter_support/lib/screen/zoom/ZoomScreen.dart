import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_support/style/Style.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

class ZoomScreen extends StatefulWidget {
  final String image;

  ZoomScreen(this.image);

  @override
  State<StatefulWidget> createState() {
    return ZoomState();
  }
}

class ZoomState extends State<ZoomScreen> {
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
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _body() =>
      Expanded(child: PhotoView(imageProvider: FileImage(File(widget.image))));

  Widget _header() => Container(
        height: appBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /**
             * Menu
             */
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: margin10),
                child: Icon(Icons.navigate_before),
              ),
            ),

            /**
             * App name
             */
            Container(
              child: Text(convertDateToString(DateTime.now().toUtc(),
                  format: 'yyyy-MM-dd HH:mm:ss')),
            ),
            /**
             * Notify
             */
            GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(right: margin10),
                  child: Icon(Icons.more_vert)),
            ),
          ],
        ),
      );

  String convertDateToString(DateTime value, {String format}) {
    if (value == null) {
      return "";
    }
    DateFormat dateFormat = DateFormat(format);
    return dateFormat.format(value);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_support/model/User.dart';
import 'package:flutter_support/style/Style.dart';

class DialogUtil {
  static final DialogUtil singleton = DialogUtil._internal();
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;

  DialogUtil._internal();

  static DialogUtil get instance => singleton;

  /// dismiss dialog
  static void popDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void itemDialog(BuildContext context, {Data value}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0.0,
            title: Center(
              child: Text(
                'Item Detail',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: margin10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text('Email : '),
                        ),
                        Container(
                          child: Text(value.email),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: margin10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Phone : '),
                      ),
                      Container(
                        child: Text(value.phone),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: margin10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Company : '),
                      ),
                      Container(
                        child: Text(value.company.name),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popDialog(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: margin20),
                    padding: EdgeInsets.all(padding10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text(
                      'Dismiss',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

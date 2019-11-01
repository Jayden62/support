import 'package:flutter/material.dart';
import 'package:flutter_support/style/Style.dart';

class EmptyItem extends StatelessWidget {
  final String content;
  final Widget widget;

  EmptyItem({this.widget, this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        widget,
        Container(
          margin: EdgeInsets.only(top: margin5),
          child: Text(
            content,
          ),
        ),
      ],
    )));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_support/style/Style.dart';

class ImageWidget extends StatefulWidget {
  final String image;

  ImageWidget(this.image);

  @override
  State<StatefulWidget> createState() => ImageState();
}

class ImageState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                image: DecorationImage(image: FileImage(File(widget.image)))),
          ),
          GestureDetector(
              onTap: () {
                /**
                 * Remove item
                 */
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.close,
                      color: whiteColor,
                      size: 18,
                    )),
              )),
        ],
      ),
    );
  }
}

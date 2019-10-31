import 'package:flutter/material.dart';
import 'package:flutter_support/style/Style.dart';

class ImageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ImageState();
}

class ImageState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.yellow[700], Colors.redAccent],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
                border: Border.all(color: Colors.red, width: 2.0)),
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

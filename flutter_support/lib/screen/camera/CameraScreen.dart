import 'package:flutter/material.dart';
import 'package:flutter_support/style/Style.dart';

class CameraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraState();
  }
}

class CameraState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.photo_camera),
              Container(
                margin: EdgeInsets.only(left: margin10),
                child: Text('Camera takes one'),
              ),
            ],
          ),
        ),
        GestureDetector(
            child: Container(
          margin: EdgeInsets.only(top: margin10, left: margin10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.add_a_photo),
              Container(
                margin: EdgeInsets.only(left: margin10),
                child: Text('Camera takes many'),
              ),
            ],
          ),
        )),
      ],
    );
  }
}

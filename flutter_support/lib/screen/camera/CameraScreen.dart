import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_support/screen/capture/CaptureScreen.dart';
import 'package:flutter_support/screen/zoom/ZoomScreen.dart';
import 'package:flutter_support/style/Style.dart';
import 'package:flutter_support/utils/NavigateUtil.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  final camera;

  CameraScreen(this.camera);

  @override
  State<StatefulWidget> createState() {
    return CameraState();
  }
}

class CameraState extends State<CameraScreen> {
  File file;

  Future gallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    file = image;
    NavigateUtil().pushScreen(context, ZoomScreen(file.path));
  }

  Future cameraOne() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    file = image;
//    await CompressUtil().compressPath(file.path);

    NavigateUtil().pushScreen(context, ZoomScreen(file.path));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: margin10, right: margin10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _options(),
            _divider(),
            _staggeredPhoto(),
          ],
        ));
  }

  Widget _staggeredPhoto() => Expanded(
      child: Container(
          margin: EdgeInsets.only(top: margin10),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) => new Container(
                color: Colors.green,
                child: new Center(
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text('$index'),
                  ),
                )),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )));

  Widget _divider() => Container(
        margin: EdgeInsets.only(top: margin10),
        child: Divider(
          color: Colors.blue,
          thickness: 1,
        ),
      );

  Widget _options() => Row(
        children: <Widget>[
          Expanded(
              child: Container(
            width: 100,
            child: FlatButton(
              color: Colors.blue[400],
              textColor: whiteColor,
              onPressed: () async {
                await cameraOne();
              },
              child: Text('Camera One'),
            ),
          )),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: margin10, right: margin10),
            width: 100,
            child: FlatButton(
              color: Colors.deepOrange[400],
              textColor: whiteColor,
              onPressed: () async {
                await gallery();
              },
              child: Text('Gallery'),
            ),
          )),
          Expanded(
              child: Container(
            width: 100,
            child: FlatButton(
              color: Colors.green[400],
              textColor: whiteColor,
              onPressed: () {
                NavigateUtil()
                    .pushScreen(context, CaptureScreen(widget.camera));
              },
              child: Text('Camera many'),
            ),
          )),
        ],
      );
}

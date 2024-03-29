import 'dart:async';

import 'package:camera_fix_exception/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support/style/Style.dart';
import 'package:flutter_support/widget/ImageWidget.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CaptureScreen extends StatefulWidget {
  final camera;

  CaptureScreen(this.camera);

  @override
  State<StatefulWidget> createState() => CaptureState();
}

class CaptureState extends State<CaptureScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//  final StreamController<String> updateValueStream = StreamController<String>();
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  final pathStream = StreamController<List<String>>.broadcast();
  List<String> pathList = [];

//  List<Photo> photos = [];
//  int count = 0;
//  String url = '';
//  String value = '';
//  String dateTime = '';
//  Data result;
//  List<String> compressPathArray = [];
  int trackingTime;

//  List<String> pathSelected = [];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    pathStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              backgroundColor: Colors.black26,
              elevation: 0,
            )),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _header(),
            _body(),
          ],
        ));
  }

//  List<Photo> createPhotos() {
//    List<Photo> photos = [];
//    for (var item in pathSelected) {
//      Photo photo =
//      Photo(id: result.imageTypeId, url: item, dateTime: dateTime);
//      photos.add(photo);
//    }
//    return photos;
//  }

  Widget _body() => Expanded(
        child: Stack(
          children: <Widget>[
            Container(
                child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the Future is complete, display the preview.
                        return CameraPreview(_controller);
                      } else {
                        // Otherwise, display a loading indicator.
                        return Center(child: CircularProgressIndicator());
                      }
                    })),

            /// tap camera
            GestureDetector(
                onTap: () async {
                  try {
                    int time = DateTime.now().millisecondsSinceEpoch;
                    if (trackingTime != null) {
                      if (time - trackingTime < 500) {
                        return;
                      }
                    }
                    trackingTime = time;

                    await _initializeControllerFuture;
                    String timestamp =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    final path = join((await getTemporaryDirectory()).path,
                        '$timestamp.jpeg');

                    await _controller.takePicture(path);
                    pathList.add(path);
                    pathStream.sink.add(pathList);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: margin30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            constraints:
                                BoxConstraints.expand(height: 50, width: 50),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 30,
                            )),
                        Container(
                            height: 100,
                            alignment: Alignment.centerLeft,
                            child: StreamBuilder(
                              stream: pathStream.stream,
                              builder: (context, snapshot) {
                                List<String> result = [];
                                if (snapshot.data != null && snapshot.hasData) {
                                  result = snapshot.data;
//                                  for (var item in result) {
//                                    bool found = false;
//                                    for (var child in snapshot.data) {
//                                      if (item == child) {
//                                        found = true;
//                                        break;
//                                      }
//                                    }
//                                    if (!found) {
//                                      result.add(item);
//                                    }
//                                  }

                                  return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: result.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            ImageWidget(result[index]),
                                  );
                                }
                                return Container(
                                  margin: EdgeInsets.only(left: margin10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue, width: 1)),
                                  child: Image.asset('assets/images/empty.png'),
                                );
                              },
                            )),
                      ],
                    )))
          ],
        ),
      );

  Widget _header() => Container(
        height: appBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: margin10),
                child: Icon(Icons.navigate_before),
              ),
            ),
            Container(
              child: Text(
                'Camera',
                style: TextStyle(fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: margin10),
                child: Icon(Icons.developer_board),
              ),
            ),
          ],
        ),
      );
}

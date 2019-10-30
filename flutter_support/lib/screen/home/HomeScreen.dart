import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_support/screen/booking/BookingScreen.dart';
import 'package:flutter_support/screen/camera/CameraScreen.dart';
import 'package:flutter_support/screen/group/GroupScreen.dart';
import 'package:flutter_support/style/Style.dart';
import 'package:flutter_support/widget/SwapWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  final PageController pageController = PageController();
  final tabStream = StreamController<int>.broadcast();

  @override
  void dispose() {
    super.dispose();
    tabStream.close();
  }

  @override
  Widget build(BuildContext context) {
    /// {WillPopScope} prevent back_button on Android to exit app.
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
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
                _footer(),
              ],
            ),
          ),
        ));
  }

  Widget _body() {
    List<Widget> pages = [
      GroupScreen(),
      BookingScreen(),
      CameraScreen(),
    ];
    return Expanded(
        child: PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: pages,
    ));
  }

  Widget _footer() => SwapWidget(
        tapGroup: () {
          Future.delayed(Duration(milliseconds: 50), () {
            tabStream.sink.add(0);
            pageController.jumpToPage(0);
          });
        },
        tapBooking: () {
          Future.delayed(Duration(milliseconds: 50), () {
            tabStream.sink.add(1);
            pageController.jumpToPage(1);
          });
        },
        tapCamera: () {
          Future.delayed(Duration(milliseconds: 50), () {
            tabStream.sink.add(2);
            pageController.jumpToPage(2);
          });
        },
      );

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
                child: Icon(Icons.menu),
              ),
            ),

            /**
             * App name
             */
            Container(
              child: Text(
                'Support',
                style: TextStyle(fontSize: 18),
              ),
            ),
            /**
             * Notify
             */
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: margin10),
//                  child: Stack(
//                    children: <Widget>[
//                      Container(child: Icon(Icons.notifications)),
//                      Positioned(
//                        right: 0,
//                        child: Container(
//                          padding: EdgeInsets.all(2),
//                          decoration: BoxDecoration(
//                            color: Colors.blue,
//                            shape: BoxShape.circle,
//                          ),
//                          child: Text(
//                            '0',
//                            style: TextStyle(color: Colors.white, fontSize: 10),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
                child: Icon(Icons.person),
              ),
            ),
          ],
        ),
      );
}

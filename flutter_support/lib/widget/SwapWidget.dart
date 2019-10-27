import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_support/style/Style.dart';

class SwapWidget extends StatefulWidget {
  final Function() tapGroup;
  final Function() tapBooking;
  final Function() tapCamera;

  SwapWidget({this.tapGroup, this.tapBooking, this.tapCamera});

  @override
  State<StatefulWidget> createState() {
    return SwapState();
  }
}

class SwapState extends State<SwapWidget> {
  Color groupColor = highLightSwapWidget;
  Color bookingColor = whiteColor;
  Color cameraColor = whiteColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: swapDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _local(),
          _booking(),
          _camera(),
        ],
      ),
    );
  }

  Widget _local() {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        widget.tapGroup();
        setState(() {
          groupColor = highLightSwapWidget;
          bookingColor = whiteColor;
          cameraColor = whiteColor;
        });
      },
      child: Container(
          color: groupColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _homeIcon(widget: Icon(Icons.people)),
              Container(
                child: Text('Group'),
              ),
            ],
          )),
    ));
  }

  Widget _homeIcon({Widget widget}) {
    return Stack(
      children: <Widget>[
        Container(child: widget),
      ],
    );
  }

  Widget _booking() {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              widget.tapBooking();
              setState(() {
                groupColor = whiteColor;
                bookingColor = highLightSwapWidget;
                cameraColor = whiteColor;
              });
            },
            child: Container(
                color: bookingColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _homeIcon(widget: Icon(Icons.zoom_out_map)),
                    Container(
                      child: Text('Booking'),
                    ),
                  ],
                ))));
  }

  Widget _camera() {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              widget.tapCamera();
              setState(() {
                groupColor = whiteColor;
                bookingColor = whiteColor;
                cameraColor = highLightSwapWidget;
              });
            },
            child: Container(
                color: cameraColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _homeIcon(widget: Icon(Icons.add_a_photo)),
                    Container(
                      child: Text('Camera'),
                    ),
                  ],
                ))));
  }
}

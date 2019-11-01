import 'package:flutter/material.dart';
import 'package:flutter_support/model/Schedule.dart';
import 'package:flutter_support/style/Style.dart';

class BookingItem extends StatefulWidget {
  final Booking item;
  final Function(Booking item) tapItem;

  BookingItem(this.item, {this.tapItem});

  @override
  State<StatefulWidget> createState() => BookingState();
}

class BookingState extends State<BookingItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
//          widget.tapItem(widget.item);
        },
        child: Card(
          margin:
              EdgeInsets.only(left: margin20, right: margin20, top: margin20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(padding20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text('title : ${widget.item.title}'),
                ),
                Container(
                  child: Text('date booked : ${widget.item.start}'),
                ),
              ],
            ),
          ),
        ));
  }
}

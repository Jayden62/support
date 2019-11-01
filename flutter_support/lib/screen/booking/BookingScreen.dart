import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_support/item/BookingItem.dart';
import 'package:flutter_support/item/EmptyItem.dart';
import 'package:flutter_support/model/Schedule.dart';
import 'package:flutter_support/utils/PrefUtil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_support/widget/CalendarWidget.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookingState();
  }
}

class BookingState extends State<BookingScreen> {
  List<Booking> result = [];
  List<Booking> cloneList = [];
  final bookedStream = StreamController<List<Booking>>.broadcast();
  String selectedDate = '';
  DateTime datePicked;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(), () async {
      /**
       * Because i don't have api booking, so that i could create booking json file. It's similar data u received from api.
       */
      String jsonFile = 'assets/files/booking.json';
      String jsonString = await rootBundle.loadString(jsonFile);
      final bookedList = json.decode(jsonString);
      for (var item in bookedList) {
        Booking obj = Booking.fromJson(item);
        result.add(obj);
      }
      print(result);
      bookedStream.sink.add(result);
      Schedule objTemp = Schedule();
      if (objTemp.data == null) {
        objTemp.data = [];
      }
      objTemp.data = result;
      PrefUtil.saveTemp(objTemp);
    });
  }

  @override
  void dispose() {
    super.dispose();
    bookedStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _calendar(),
            _bookedList(),
          ],
        ),
      ),
    );
  }

  Widget _bookedList() => Expanded(
        child: Container(
            child: StreamBuilder(
          stream: bookedStream.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Booking> data = [];

            if (snapshot.data != null && snapshot.hasData) {
              data = snapshot.data;

              if (datePicked == null) {
                String current =
                    convertDateToString(DateTime.now(), format: 'yyyy-MM-dd');
                data = data.where((i) => i.start == current).toList();
              } else {
                String current =
                    convertDateToString(datePicked, format: 'yyyy-MM-dd');
                data = data.where((i) => i.start == current).toList();
              }

              return data.isNotEmpty
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => BookingItem(data[index]))
                  : EmptyItem(
                      content: 'No availabel data !',
                      widget: Icon(Icons.more_horiz),
                    );
            }

            return Container();
          },
        )),
      );

  Widget _calendar() => CalendarWidget(
        bookedStream: bookedStream,
        tapSelectDate: (DateTime value) async {
          Schedule result = await PrefUtil.getTemp();
          if (result == null) {
            return;
          }
          datePicked = value;
          String date = convertDateToString(datePicked, format: 'yyyy-MM-dd');
          result.data = result.data.where((i) => i.start == date).toList();

          bookedStream.sink.add(result.data);
        },
      );

  String convertDateToString(DateTime value, {String format}) {
    if (value == null) {
      return "";
    }
    DateFormat dateFormat = DateFormat(format);
    return dateFormat.format(value);
  }
}

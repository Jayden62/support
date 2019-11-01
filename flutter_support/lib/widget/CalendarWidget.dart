import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_support/model/Schedule.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime value) tapSelectDate;
  final StreamController bookedStream;

  CalendarWidget({this.tapSelectDate, this.bookedStream});

  @override
  State<StatefulWidget> createState() {
    return CalendarState();
  }
}

class CalendarState extends State<CalendarWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  Map<DateTime, List> _holidays = Map();
  Map<DateTime, List> bookedList = Map();

  @override
  void initState() {
    super.initState();

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    widget.tapSelectDate(day);
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _tableCalendar(),
      ],
    ));
  }

  Widget _tableCalendar() {
    return StreamBuilder(
      stream: widget.bookedStream.stream,
      builder: (context, snapshot) {
        List<Booking> result = [];
        if (snapshot.data != null && snapshot.hasData) {
          result = snapshot.data;
          /**
           * formatter DateTime in Flutter, it's just get format yyyy-MM-dd, due to i must implement substring function to split each param.
           */
          for (var item in result) {
            int year = int.parse(item.start.substring(0, 4));
            int month = int.parse(item.start.substring(5, 7));
            int day = int.parse(item.start.substring(8, 10));

            bookedList[DateTime(year, month, day)] = [item.title];
          }
          _holidays.addAll(bookedList);
          return TableCalendar(
            calendarController: _calendarController,
            holidays: _holidays,
            daysOfWeekStyle:
                DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.grey)),

            initialSelectedDay: DateTime.now().toUtc(),
            /**
             * {startDay} : it's disable previous days, due to u could not pick them. Try unlock {startDay} to get to know detail.
             */
//            startDay: DateTime.now().toUtc(),
            startingDayOfWeek: StartingDayOfWeek.sunday,

            calendarStyle: CalendarStyle(
                holidayStyle: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
                selectedColor: Colors.deepOrange[400],
                todayColor: Colors.deepOrange[200],
                weekendStyle: TextStyle(color: Colors.grey),
                outsideDaysVisible: true,
                outsideWeekendStyle: TextStyle(color: Colors.grey)),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
            ),

            onDaySelected: _onDaySelected,
            onVisibleDaysChanged: _onVisibleDaysChanged,
          );
        }
        return Container();
      },
    );
  }
}

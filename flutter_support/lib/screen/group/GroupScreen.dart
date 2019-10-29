import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_support/api/API.dart';
import 'package:flutter_support/item/GroupItem.dart';
import 'package:flutter_support/model/User.dart';
import 'package:flutter_support/style/Style.dart';
import 'package:flutter_support/utils/DialogUtil.dart';

class GroupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GroupState();
  }
}

class GroupState extends State<GroupScreen> {
  var searchController = TextEditingController();
  final userStream = StreamController<List<Data>>.broadcast();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(), () async {
      List<Data> result = await API.instance.getUsers();
      if (result == null) {
        return;
      }
      userStream.sink.add(result);
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    userStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin10, right: margin10, top: margin10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _searchGroup(),
          _groups(),
        ],
      ),
    );
  }

  Widget _groups() => Expanded(
      child: Container(
          margin: EdgeInsets.only(top: margin10),
          child: StreamBuilder(
            stream: userStream.stream,
            builder: (context, snapshot) {
              List<Data> groupList = [];
              if (snapshot.data != null && snapshot.hasData) {
                groupList = snapshot.data;
                return ListView.builder(
                  itemCount: groupList.length,
                  itemBuilder: (BuildContext context, int index) => GroupItem(
                    groupList[index],
                    tapItem: (Data value) {
                      DialogUtil.instance.itemDialog(context, value: value);
                    },
                  ),
                );
              }
              return Container();
            },
          )));

  Widget _searchGroup() => Container(
      padding: EdgeInsets.all(padding5),
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 196, 189, 188), width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(child: Icon(Icons.search)),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: margin10),
                  child: TextField(
                    onChanged: (value) {},
                    controller: searchController,
                    maxLines: 1,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Search group',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.normal),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ))),
        ],
      ));
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_support/item/GroupItem.dart';
import 'package:flutter_support/model/Group.dart';
import 'package:flutter_support/style/Style.dart';

class GroupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GroupState();
  }
}

class GroupState extends State<GroupScreen> {
  var searchController = TextEditingController();
  List<Group> groupList = [];

  @override
  void initState() {
    super.initState();
    groupList.add(Group(
        title: 'Flutter community',
        description: 'abcccccccccccccccccccccccccccccccccc'));
    groupList.add(Group(
        title: 'Flutter community',
        description: 'abcccccccccccccccccccccccccccccccccc'));
    groupList.add(Group(
        title: 'Flutter community',
        description: 'abcccccccccccccccccccccccccccccccccc'));
    groupList.add(Group(
        title: 'Flutter community',
        description: 'abcccccccccccccccccccccccccccccccccc'));
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin10, right: margin10, top: margin10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _searchGroup(),
          _filterGroup(),
          _groups(),
        ],
      ),
    );
  }

  Widget _groups() => Expanded(
          child: ListView.builder(
        itemCount: groupList.length,
        itemBuilder: (BuildContext context, int index) =>
            GroupItem(groupList[index]),
      ));

  Widget _filterGroup() => Container(
      margin: EdgeInsets.only(left: margin10, right: margin10, top: margin10),
      child: Center(
        child: Text('Filter group'),
      ));

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

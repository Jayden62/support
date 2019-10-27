import 'package:flutter/material.dart';
import 'package:flutter_support/model/Group.dart';
import 'package:flutter_support/style/Style.dart';

class GroupItem extends StatefulWidget {
  final Group item;

  GroupItem(this.item);

  @override
  State<StatefulWidget> createState() {
    return GroupItemState();
  }
}

class GroupItemState extends State<GroupItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 4,
        child: Container(
            margin: EdgeInsets.only(top: margin10),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/creator.jpg',
                              )),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 1)),
                      margin: EdgeInsets.only(left: margin10, bottom: margin10),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: margin10),
                      child: Text(
                        'Creator : Jackie Lê',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: margin20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Group title : IT'),
                        ),
                        Container(
                          child: Text('abcccccccccccccccccccccccccccccc'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}

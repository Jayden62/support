import 'package:flutter/material.dart';
import 'package:flutter_support/model/User.dart';
import 'package:flutter_support/style/Style.dart';

class GroupItem extends StatefulWidget {
  final Data item;

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
                        'Creator : ${widget.item.name}',
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
                          child: Text('Email : ${widget.item.email}'),
                        ),
                        Container(
                          child: Text('Phone : ${widget.item.phone}'),
                        ),
                        Container(
                          child: Text('Company : ${widget.item.company.name}'),
                        ),
                        Container(
                          child: Text(
                              'Address : ${widget.item.address.city} ${widget.item.address.street}'),
                        ),
                        Container(
                          child: Text('Website : ${widget.item.website}'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}

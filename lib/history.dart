import 'dart:ui';

import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final List<String> listViewItem;

  const History({Key key, @required this.listViewItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listViewItem.map((String value) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Text(
            value,
            style: TextStyle(fontSize: 15),
          ),
        );
      }).toList(),
    );
  }
}

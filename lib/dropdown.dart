import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final List<String> listView;
  final String newValue;
  final Function newMethod;

  const Dropdown({
    Key key,
    this.listView,
    this.newValue,
    this.newMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: listView.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: newValue,
      onChanged: newMethod,
    );
  }
}

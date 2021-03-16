import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;

  const Result({Key key, @required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            result.toStringAsFixed(0),
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}

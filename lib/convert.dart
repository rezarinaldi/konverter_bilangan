import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function convertHandler;

  const Convert({Key key, @required this.convertHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: convertHandler,
        color: Colors.deepPurpleAccent,
        textColor: Colors.white,
        child: Text("Konversi Bilangan"),
      ),
    );
  }
}

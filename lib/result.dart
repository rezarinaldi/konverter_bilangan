import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required this.result,
  }) : super(key: key);

  final int result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: GoogleFonts.inter(
              fontSize: 20,
            ),
          ),
          Text(
            result.toStringAsFixed(0),
            style: GoogleFonts.inter(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}

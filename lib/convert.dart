import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key key,
    @required this.convertHandler,
  });

  final Function convertHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: convertHandler,
        color: Colors.deepPurpleAccent,
        textColor: Colors.white,
        child: Text(
          "Konversi",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

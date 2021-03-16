import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatelessWidget {
  const History({
    Key key,
    @required this.listViewItem,
  }) : super(key: key);

  final List<String> listViewItem;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listViewItem.map((String value) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 15,
            ),
          ),
        );
      }).toList(),
    );
  }
}

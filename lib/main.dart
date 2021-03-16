import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';
import 'history.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etDecimal = new TextEditingController();

  int nBilangan = 0;
  String _valueFrom = "Decimal";
  String _valueTo = "Binary";
  int _result = 0;
  List<String> listViewItem = [];

  void _konversiBilangan() {
    setState(() {
      nBilangan = int.parse(etDecimal.text);
      if (_valueFrom == "Decimal") {
        if (_valueTo == "Binary") {
          int nBiner = 0;
          int i = 1;
          while (nBilangan > 0) {
            nBiner = nBiner + (nBilangan % 2) * i;
            nBilangan = (nBilangan / 2).floor();
            i = i * 10;
          }
          _result = nBiner;
        } else if (_valueTo == "Octal") {
          int nOctal = 0;
          int i = 1;
          while (nBilangan > 0) {
            nOctal = nOctal + (nBilangan % 8) * i;
            nBilangan = (nBilangan / 8).floor();
            i = i * 10;
          }
          _result = nOctal;
        }
      } else if (_valueFrom == "Binary") {
        if (_valueTo == "Decimal") {
          int nDecimal = 0;
          int last;
          int i = 1;
          while (nBilangan > 0) {
            last = nBilangan % 10;
            nBilangan = (nBilangan / 10).floor();
            nDecimal += last * i;
            i = i * 2;
          }
          _result = nDecimal;
        } else if (_valueTo == "Octal") {
          int nDecimal = 0;
          int nOctal = 0;
          int last;
          int i = 1;
          while (nBilangan != 0) {
            last = nBilangan % 10;
            nBilangan = (nBilangan / 10).floor();
            nDecimal += last * i;
            i = i * 2;
          }
          i = 1;
          while (nDecimal > 0) {
            nOctal = nOctal + (nDecimal % 8) * i;
            nDecimal = (nDecimal / 8).floor();
            i = i * 10;
          }
          _result = nOctal;
        }
      } else if (_valueFrom == "Octal") {
        if (_valueTo == "Binary") {
          int nDecimal = 0;
          int last;
          int nBiner = 0;
          int i = 1;
          while (nBilangan != 0) {
            last = nBilangan % 10;
            nBilangan = (nBilangan / 10).floor();
            nDecimal += last * i;
            i = i * 8;
          }
          i = 1;
          while (nDecimal > 0) {
            nBiner = nBiner + (nDecimal % 2) * i;
            nDecimal = (nDecimal / 2).floor();
            i = i * 10;
          }
          _result = nBiner;
        } else if (_valueTo == "Decimal") {
          int nDecimal = 0;
          int last;
          int i = 1;
          while (nBilangan > 0) {
            last = nBilangan % 10;
            nBilangan = (nBilangan / 10).floor();
            nDecimal += last * i;
            i = i * 8;
          }
          _result = nDecimal;
        }
      }
      listViewItem.insert(0, "$_valueTo : $_result");
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _valueFrom = changeValue;
    });
  }

  void dropdownOnChanged2(String changeValue) {
    setState(() {
      _valueTo = changeValue;
    });
    _konversiBilangan();
  }

  var listString = [
    "Binary",
    "Decimal",
    "Octal",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverter Bilangan',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Bilangan"),
        ),
        body: Container(
          margin: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(etDecimal: etDecimal),
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                ),
                child: Text(
                  "dari Bilangan",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                  ),
                ),
              ),
              Dropdown(
                listView: listString,
                newValue: _valueFrom,
                newMethod: dropdownOnChanged,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Konversi ke Bilangan",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                  ),
                ),
              ),
              Dropdown(
                listView: listString,
                newValue: _valueTo,
                newMethod: dropdownOnChanged2,
              ),
              Result(
                result: _result,
              ),
              Convert(convertHandler: _konversiBilangan),
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                ),
                child: Text(
                  "History Konversi",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: History(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

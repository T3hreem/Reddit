

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class WarningPage1 extends StatefulWidget {
  const WarningPage1({Key key}) : super(key: key);

  @override
  State<WarningPage1> createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.center,
      child: Text(
        "Sorry \n You shuold signin first",
        style: TextStyle(
          fontSize: 70,
          fontFamily: "Raleway-ThinItalic",
          backgroundColor: Colors.orange,
          color: Colors.indigo
        ),
      ),
    );
  }
}

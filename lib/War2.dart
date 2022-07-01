



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class War2 extends StatefulWidget {
  const War2({Key key}) : super(key: key);

  @override
  State<War2> createState() => _WarningPageState();
}

class _WarningPageState extends State<War2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.center,
      child: Text(
        "Sorry \n this email is already used!!",
        style: TextStyle(
            fontSize: 70,
            fontFamily: "Raleway-ThinItalic",
            backgroundColor: Colors.green,
            color: Colors.red
        ),
      ),
    );
  }
}

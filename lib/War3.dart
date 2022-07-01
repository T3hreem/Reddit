



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class War3 extends StatefulWidget {
  const War3({Key key}) : super(key: key);

  @override
  State<War3> createState() => _WarningPageState();
}

class _WarningPageState extends State<War3> {
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

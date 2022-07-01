


import 'dart:io';
import 'signup.dart';
import 'package:ap_project/WarningPage.dart';
import 'package:ap_project/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  String check;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Login",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Login to your acount",
                            style: TextStyle(fontSize: 15, color: Colors.grey[700]))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          inputFile(label: "Username",TextEditingController: username),
                          inputFile(label: "Password", obscureText: true,TextEditingController: password),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            send();
                            if (check!="0")
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FeedPage()));
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context) => WarningPage1()));
                            }
                          },
                          color: Colors.deepOrange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an acount?"),

                        InkWell(
                          child:Text(
                              " Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ) ,
                          onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));},
                          ) ,
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100),
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/login.png"),
                              fit: BoxFit.fitHeight)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
  send() async {
    String request = "login-" + username.text + "-" + password.text + "-\u0000";
    await Socket.connect("10.0.2.2", 1234).then((serverSocket){

      serverSocket.write(request);
      serverSocket.flush();

      serverSocket.listen((response){
        print(String.fromCharCodes(response));
        check = String.fromCharCodes(response);
      }
      );
    });

  }
}

Widget inputFile({label, obscureText = false,TextEditingController TextEditingController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: TextEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
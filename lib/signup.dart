import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feed.dart';

class signup extends StatefulWidget {
  const signup({Key key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  String check = "";
  TextEditingController email = TextEditingController(text: "");
  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  TextEditingController configpassword = TextEditingController(text: "");
  Widget massage1(){
    return FloatingActionButton(onPressed:(){},backgroundColor: Colors.indigo);
  }
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
                          "Sing up",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Create an account, it's free",
                            style: TextStyle(fontSize: 15, color: Colors.grey[700]))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          inputFile(label: "Email",TextEditingController: email),
                          inputFile(label: "Username",TextEditingController: username),
                          inputFile(label: "Password", obscureText: true,TextEditingController: password),
                          inputFile(label: "Confirm Password", obscureText: true,TextEditingController: configpassword),
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
                          onPressed: () { ///////////////0(pasword qalat) 1(okeye) -1(moshkel!!)////////////////////
                            send();
                            print("Cheeeeeeeeeeeeeeeeeeeeeeeeeeeeeeck isssssss $check");

                            if (check=="1")
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FeedPage()));
                            if (check=="0"){
                              setState(() {
                                massage1();
                              });
                            }
                            if (check=="-1"){
                              Container(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(16.0),
                                  color: Colors.green,
                                ),
                                child: Text(
                                  "Sorry!This email is exist too",
                                  style: TextStyle(
                                    backgroundColor: Colors.red,
                                    color: Colors.black,

                                  ),
                                ),
                              );
                            }
                            },
                          color: Colors.deepOrange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Sing up",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100),
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/signup.png"),
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
    if(password.text != configpassword.text){
      check = "0";
      return;
    }
    String request = "signup-" + email.text + "-" + username.text + "-" + password.text + "-\u0000";
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

Widget massage(){
  return Container(
    padding: EdgeInsets.only(left: 22222),
    decoration: new BoxDecoration(
      borderRadius: new BorderRadius.circular(160.0),
      color: Colors.blueAccent,
    ),
    child:Row(
      children:[
        Text(
          "Sorry!The email is not correct",
          style: TextStyle(
            fontSize: 1000,
            backgroundColor: Colors.red,
            color: Colors.black,

          ),
        ),
      ],
    ) ,
  );
}


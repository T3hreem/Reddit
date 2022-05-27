
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Alerts.dart';
import 'maps.dart';
import 'add.dart';
import 'dashbord.dart';
//import 'package:redit/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit',
      theme: ThemeData(
      ),
      home: const MyHomePage(title: 'Reddit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  //MaterialColor Color = Colors.red;
  //TextStyle textStyle = textStyle.merge(Alignment.center);
  @override
  State<MyHomePage> createState() => _MyHomePageState(0);


}

class _MyHomePageState extends State<MyHomePage> {

  int SelectedPage;
  int index;
  final double iconSize = 30;

  _MyHomePageState(this.SelectedPage);
  List<Widget> pages = [Alerts(),maps(),add(),dashbord()];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //appBar: AppBar(title: Text(widget.title,style:TextStyle(color: Colors.purple,fontSize: 25,fontWeight: FontWeight.bold)),),
      title:"Reddit",

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home:Scaffold(
        appBar: AppBar(
          //leading: Icon(Icons.pending,color: Colors.indigo,),
          leading: IconButton(
            icon: Icon(
              Icons.pending,
              color: Colors.indigo,
            ),
            padding: EdgeInsets.only(left: 10),
            onPressed: () {
              // do something
            },
          ),
          backgroundColor: Color.fromRGBO(233, 188, 14, 0),

          title : Container(
            // alignment: Alignment.center,
              width: 300,
              height: 40,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black12, borderRadius: BorderRadius.circular(100)),margin: EdgeInsets.only(right:50,top: 6),


              child: TextField(

                decoration: InputDecoration(

                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none
                ),
              )

          ),
          actions:<Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.indigo,
              ),
              padding: EdgeInsets.only(right:30),
              onPressed: () {
                // do something
              },
            )
          ],
        ),


        body: Container(

          child: Column(
            children:[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 10),
                    child : CircleAvatar(
                      child: Image(
                        image: AssetImage("assets/icon.jpg"),
                        fit: BoxFit.cover,),
                      backgroundColor: Colors.lightGreen,
                      radius: 20,
                    ),
                  ),
                  const SizedBox(width:10,),
                  Column(
                    children: [
                      Text(
                        'userrname',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "fonts/DancingScript-Regular.ttf",
                          height: 1.5,
                        ),
                      ),

                      //const SizedBox(height: 10,),
                      Text(
                        'Comment!........',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          //textBaseline: TextBaseline.ideographic,
                          fontFamily:'assets/Merriweather-BoldItalic.ttf',
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ],
                //margin:EdgeInsets.only(right: 250,left:10,bottom:470),

              ),
            ],
          ),

          //alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //       Color(0xFFffadad),
          //       Color(0xFFffd6a5),
          //       Color(0xFFfdffb6),
          //       Color(0xFFcaffbf),
          //       Color(0xFF9bf6ff),
          //       Color(0xFFa0c4ff),
          //       Color(0xFFbdb2ff),
          //       Color(0xFFffc6ff),
          //       Color(0xFFfffffc),
          //
          //     ],
          //   ),
          // ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          items:[
            BottomNavigationBarItem(
              icon: Icon(
                SelectedPage==0?Icons.home:
                Icons.home_outlined,
                color: Colors.deepOrange,

              ),
              label: '',
              backgroundColor : Colors.lightGreen,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                SelectedPage==1? Icons.dashboard:Icons.dashboard_outlined,
                color: Colors.deepOrange,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(SelectedPage==2?Icons.add_circle:
              Icons.add,
                color: Colors.deepOrange,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(SelectedPage==3?Icons.maps_ugc:
              Icons.maps_ugc_sharp,
                color: Colors.deepOrange,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(SelectedPage==4?Icons.add_alert:
              Icons.add_alert_outlined,
                color: Colors.deepOrange,
              ),
              label: '',
            )
          ],
          onTap:
          _onItemTapped,

        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      SelectedPage = index;
      switch(index){
        case 1: Navigator.push(context, MaterialPageRoute(builder: (context) => dashbord()));break;
        case 2: Navigator.push(context, MaterialPageRoute(builder: (context) => add()));break;
        case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => maps()));break;
        case 4: Navigator.push(context, MaterialPageRoute(builder: (context) => Alerts()));break;
      };

    });
  }
}


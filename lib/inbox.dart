import 'package:ap_project/chat.dart';
import 'package:ap_project/creat.dart';
import 'package:ap_project/premium.dart';
import 'package:flutter/material.dart';
import 'add.dart';
import 'dashbord.dart';
import 'feed.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  int SelectedPage = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox",style: TextStyle
          (color: Colors.black),),
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
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
           Container(
             child: Text("Be the first to know",
             style: TextStyle(fontSize: 24,
             fontWeight: FontWeight.w800),),
           ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text("This is where you get update on your",
              style: TextStyle(fontSize: 18,
              color: Colors.grey[500]),),
            ),
            Container(
              child: Text("activity and recommendaitions",
                style: TextStyle(fontSize: 18,
                    color: Colors.grey[500]),),
            ),
            SizedBox(height: 60,),
            Container(
              padding: EdgeInsets.only(top: 100),
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/blackreddit.png"),
                      fit: BoxFit.fitHeight)),
            ),
            Container(

              child: Text("Wow, such empty",
                style: TextStyle(fontSize: 18,
                    color: Colors.grey[700],
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items:[
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage==0?Icons.home:
              Icons.home_outlined,
              color: Colors.black,
            ),
            label: 'Home',
            backgroundColor : Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage==1? Icons.dashboard:Icons.dashboard_outlined,
              color: Colors.black,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(SelectedPage==2?Icons.add_circle:
            Icons.add,
              color: Colors.black,
            ),
            label: 'Creat',
          ),
          BottomNavigationBarItem(
            icon: Icon(SelectedPage==3?Icons.chat_rounded:
            Icons.chat_outlined,
              color: Colors.black,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(SelectedPage==4?Icons.add_alert:
            Icons.add_alert_outlined,
              color: Colors.black,
            ),
            label: 'Inbox',
          )
        ],
        onTap:_onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      SelectedPage = index;
      switch(index){
        case 0: Navigator.push(context, MaterialPageRoute(builder: (context) => FeedPage()));break;
        case 1: Navigator.push(context, MaterialPageRoute(builder: (context) => dashbord()));break;
        case 2: Navigator.push(context, MaterialPageRoute(builder: (context) => CreatPage()));break;
        case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));break;
      };

    });
  }
}

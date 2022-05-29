import 'package:ap_project/dashbord.dart';
import 'package:flutter/material.dart';
import 'dashbord.dart';
import 'Alerts.dart';
import 'add.dart';
import 'feed.dart';
import 'maps.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int SelectedPage = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items:[
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage==0?Icons.home:
              Icons.home_outlined,
              color: Colors.deepOrange,

            ),
            label: 'Home',
            backgroundColor : Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage==1? Icons.dashboard:Icons.dashboard_outlined,
              color: Colors.deepOrange,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(SelectedPage==2?Icons.add_circle:
            Icons.add,
              color: Colors.deepOrange,
            ),
            label: 'Creat',
          ),
          BottomNavigationBarItem(
            icon: Icon(SelectedPage==3?Icons.chat_rounded:
            Icons.chat_outlined,
              color: Colors.deepOrange,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(SelectedPage==4?Icons.add_alert:
            Icons.add_alert_outlined,
              color: Colors.deepOrange,
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
        case 2: Navigator.push(context, MaterialPageRoute(builder: (context) => dashbord()));break;
        case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => maps()));break;
        case 4: Navigator.push(context, MaterialPageRoute(builder: (context) => Alerts()));break;
      };

    });
  }
}

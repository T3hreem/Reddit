
import 'package:ap_project/CommunityPage.dart';
import 'package:ap_project/chat.dart';
import 'package:ap_project/creat.dart';
import 'package:ap_project/inbox.dart';
import 'package:ap_project/setting.dart';

import 'Alerts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CommunityPage.dart';
import 'feed.dart';
import 'add.dart';
import 'maps.dart';
import 'chat.dart';
class dashbord extends StatefulWidget {
  const dashbord ({Key key}) : super(key: key);

  @override
  State<dashbord> createState() => _dashbord();
}


class _dashbord extends State<dashbord> {

  List<Community> comunities = [
    Community("Computer Engniering"),
    Community("Group1"),
    Community("001"),
    Community("SBU"),
    Community("Sharif00141"),
    Community("F(*)F"),
    Community("استقلال**"),
    Community("SBU.Computer"),
    Community("sbu1234560"),
    Community("sbu.025"),
    Community("ssbbuuuuuu"),
    Community("Mehdi.Co"),
  ];
  int SelectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              color: Colors.deepOrange,
            ),
            padding: EdgeInsets.only(right:30),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
          )
        ],
      ),

      body:ListView.builder(itemCount: comunities.length,
          itemBuilder: (BuildContext context,int index){
            return _widget(comunities[index]);
          }
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
        case 2: Navigator.push(context, MaterialPageRoute(builder: (context) => CreatPage()));break;
        case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));break;
        case 4: Navigator.push(context, MaterialPageRoute(builder: (context) => InboxPage()));break;
      };

    });
  }
  _widget(Community community){

    return Container(

      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                    child: Image(
                        image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,),
                  backgroundColor: Colors.black,
                  radius: 24,
                  ),
            title: Container(


              child:  Row(
                children: [
                  Text(
                    community.name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            trailing: GestureDetector(
              child: Container(
    margin: EdgeInsets.only(right: 2),
    child:IconButton(onPressed: (){
      setState(() {
        community.liked=!community.liked;
      });
    }, icon: Icon(

      community.liked?Icons.star:
      Icons.star_border,

    )) ,
                ),
              ),
            onTap: (){
            },
            ),
        ],
      ),
    );
  }
}
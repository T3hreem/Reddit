import 'package:ap_project/inbox.dart';
import 'package:ap_project/premium.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'dashbord.dart';
import 'feed.dart';

class CreatPage extends StatefulWidget {
  const CreatPage({Key key}) : super(key: key);

  @override
  State<CreatPage> createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {
  int SelectedPage = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create a post",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actions: [
          Container(
            child: MaterialButton(
              minWidth: 50,
              height: 20,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PremiumPage()));
              },
              color: Colors.white,
              elevation: 0,
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(children: [
          TextField(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            decoration: InputDecoration(
              hintText: "  An interesting title...",
              hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              contentPadding: EdgeInsets.only(bottom: 320),
            ),
          ),
          MaterialButton(
              minWidth: 400,
              height: 55,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PremiumPage()));
              },
              child: Row(
                children: [
                  Icon(Icons.image_outlined,
                      color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Image",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
          MaterialButton(
              minWidth: 400,
              height: 55,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PremiumPage()));
              },
              child: Row(
                children: [
                  Icon(Icons.videocam_outlined,
                      color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Video",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
          MaterialButton(
              minWidth: double.infinity,
              height: 55,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PremiumPage()));
              },
              child: Row(
                children: [
                  Icon(Icons.text_snippet_outlined,
                      color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Text",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
          MaterialButton(
              minWidth: 400,
              height: 55,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PremiumPage()));
              },
              child: Row(
                children: [
                  Icon(Icons.link, color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Link",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
          MaterialButton(
              minWidth: 400,
              height: 55,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PremiumPage()));
              },
              child: Row(
                children: [
                  Icon(Icons.poll_outlined, color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Poll",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage == 0 ? Icons.home : Icons.home_outlined,
              color: Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage == 1 ? Icons.dashboard : Icons.dashboard_outlined,
              color: Colors.black,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage == 2 ? Icons.add_circle : Icons.add,
              color: Colors.black,
            ),
            label: 'Creat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage == 3 ? Icons.chat_rounded : Icons.chat_outlined,
              color: Colors.black,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SelectedPage == 4 ? Icons.add_alert : Icons.add_alert_outlined,
              color: Colors.black,
            ),
            label: 'Inbox',
          )
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      SelectedPage = index;
      switch (index) {
        case 0:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FeedPage()));
          break;
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => dashbord()));
          break;
        case 4:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InboxPage()));
          break;
        case 3:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatPage()));
          break;
      }
      ;
    });
  }
}

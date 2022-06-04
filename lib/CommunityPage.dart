import 'Posts.dart';
import 'creat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Alerts.dart';
import 'inbox.dart';
import 'feed.dart';
import 'dashbord.dart';
import 'setting.dart';
import 'chat.dart';

class CommunityPage extends StatefulWidget {
  Post post;
  CommunityPage(this.post,{Key key,}) : super(key: key);

  @override
  State<CommunityPage> createState() => _State();
}

class _State extends State<CommunityPage> {
  int SelectedPage = 1;
  final double iconSize = 30;
  TextEditingController inString = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //leading: Icon(Icons.pending,color: Colors.indigo,),
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.deepOrange,
            ),
            padding: EdgeInsets.only(left: 10),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => dashbord()));
            },
          ),
          backgroundColor: Color.fromRGBO(233, 188, 14, 0),

          title: Container(
              width: 300,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(100)),
              margin: EdgeInsets.only(right: 50),
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.deepOrange,
                    ),


                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          inString = null;
                        });
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.deepOrange,
              ),
              padding: EdgeInsets.only(right: 30),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return _widget(Builder, index);
            }),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                SelectedPage == 0 ? Icons.home : Icons.home_outlined,
                color: Colors.black,
              ),
              label: 'Home',

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
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      SelectedPage = index;
      switch (index) {
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => dashbord()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreatPage()));
          break;
        case 3:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatPage()));
          break;
        case 4:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InboxPage()));
          break;
      }
    });
  }

  _widget(BuildContext, int index) {
    var post = widget.post;
    return Container(
      child: Column(
        children: [

          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/originals/f4/d8/c5/f4d8c5c8c9f9f9c8b8f9f9c8b8f9f9f9.jpg'),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      '${post.user.community.name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '${post.user.community.name}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            ],
                            ),
                            ),
                      Container(
                              child: IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.blue,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

          ListTile(
            leading:Text(
              post.user.community.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            title: Text(
                post.user.name),
            subtitle: Text(
              post.user.name,
              style : TextStyle(fontFamily: 'Raleway'),
            ),

            tileColor: Colors.black38,
            //onTap: ,
          ),

          ListTile(
            tileColor: Colors.black12,
            title: Text(post.comments[index].comment,
              style: TextStyle(fontFamily: 'Raleway'),
            ),
          ),

          Row(
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_upward_rounded,
                      color: Colors.black38, size: 25.0),
                  onPressed: () {
                    setState(() {
                      post.vote++;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  post.vote.toString(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        post.vote--;
                      });

                    },
                    icon: Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.black38,
                      size: 25.0,
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, top: 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.messenger_outline_outlined,
                      color: Colors.black38,
                      size: 25.0,
                    ),
                    onPressed: () {
                      setState(() {
                        post.comment++;
                      });

                    },
                  )),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: Text(
                  post.comment.toString(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 18, top: 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.black38,
                      size: 25.0,
                    ),
                    onPressed: () {},
                  )),
              Container(
                margin: EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  'Share',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 25, top: 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.card_giftcard,
                      color: Colors.black38,
                      size: 25.0,
                    ),
                    onPressed: () {},
                  )),
            ],
          )
        ],
      ),
    );
  }
}

// import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Alerts.dart';
import 'inbox.dart';
import 'maps.dart';
import 'add.dart';
import 'dashbord.dart';
//import 'package:redit/SplashScreen.dart';
import 'setting.dart';
import 'chat.dart';

class User {
  Community community;
  String name;
  User(this.name, this.community);
}

class Community {
  //User users;
  String name;
  Community(this.name);
// Array user;
}

class Post {
  int comment;
  int vote;
  Image profile;
  User user;
  String post;

  Post(int comment, int vote, User user, String post) {
    this.comment = comment;
    this.vote = vote;
    this.post = post;
    this.user = user;
  }
}

class FeedPage extends StatefulWidget {
  const FeedPage({
    Key key,
  }) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPage(0);
}

class _FeedPage extends State<FeedPage> {
  List<Post> list = [
    Post(55, 33, User("maaamod", Community("company1")),
        "hellooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"),
    Post(52, 655, User("nader", Community("company2")), "salam"),
    Post(500, 33, User("abolfazl", Community("company3")), "bye"),
    Post(53, 6, User("mehdi", Community("company4")), "bah bah"),
    Post(52, 9, User("morteza", Community("company5")), "manteghie"),
    Post(55, 8, User("mehdi m", Community("company6")), "eeeeeee"),
    Post(52, 22, User("eshgam j", Community("company2")), "feshar bokhor"),
    Post(50, 22121, User("mehdi zi", Community("company1")), "eeeeee"),
  ];

  int SelectedPage;
  int listCounter;
  int index;
  final double iconSize = 30;

  _FeedPage(this.SelectedPage);
  List<Widget> pages = [Alerts(), maps(), add(), dashbord()];

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
              // do something
            },
          ),
          backgroundColor: Color.fromRGBO(233, 188, 14, 0),

          title: Container(
              // alignment: Alignment.center,
              width: 300,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(100)),
              margin: EdgeInsets.only(right: 50, top: 6),
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
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _widget(list[index]);
            }),
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
              context, MaterialPageRoute(builder: (context) => add()));
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

  _widget(Post post) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image(
                image: AssetImage("assets/logo.png"), //aks ekhtesasi
                fit: BoxFit.cover,
              ),
              backgroundColor: Colors.black,
              radius: 20,
            ),
            title: Text(post.user.community.name),
            subtitle: Text(post.user.name),
            tileColor: Colors.black38,
          ),
          ListTile(
            tileColor: Colors.black12,
            title: Text(post.post),
          ),
          Row(
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_upward_rounded,
                      color: Colors.black38, size: 25.0),
                  onPressed: () {
                    setState(() {
                      /* on pressed    */
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
                    onPressed: () {},
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
                    onPressed: () {},
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

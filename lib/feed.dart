// import 'dart:ffi';
import 'creat.dart';
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
  bool liked;
  //User users;
  String name;
  Community(String name){
  this.name = name;
  liked = false;
  }
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
    Post(55, 33, User("mahmod", Community("company1")),
        "Engineering requires many building blocks and tools. To produce real world results, one must practically apply mathematics and sciences to tangible problems and scenarios. Included in this category are the various technical topics which cut across engineering disciplines, encompassing many branches of mathematics and scientific disciplines."),
    Post(52, 655, User("nader", Community("company2")),
        "STARS articles are peer-reviewed articles on the history of major developments in technology. Available in the scientific tools and discovery category are:"),
    Post(500, 33, User("abolfazl", Community("company3")),
        "The introduction of electric power in the 19th century led to the rise of electrical and hybrid electro-mechanical devices to carry out both digital (Hollerith punch-card machine) and analog (Bush’s differential analyzer) calculation. Telephone switching came to be based on this technology, which led to the development of machines that we would recognize as early computers."),
    Post(53, 6, User("mehdi", Community("company4")),
        "The presentation of the Edison Effect in 1885 provided the theoretical background for electronic devices. Originally in the form of vacuum tubes, electronic components were rapidly integrated into electric devices, revolutionizing radio and later television. It was in computers however, where the full impact of electronics was felt. Analog computers used to calculate ballistics were crucial to the outcome of World War II, and the Colossus and the ENIAC, the two earliest electronic digital computers, were developed during the war."),
    Post(52, 9, User("morteza", Community("company5")),
        "With the invention of solid-state electronics, the transistor and ultimately the integrated circuit, computers would become much smaller and eventually affordable for the average consumer. Today “computers” are present in nearly every aspect of everyday life, from watches to automobiles."),
    Post(55, 8, User("mehdi m", Community("company6")),
        "Computer engineering (CoE or CpE) is a branch of electrical engineering that integrates several fields of computer science and electronic engineering required to develop computer hardware and software.[1] Computer engineers usually have training in electronic engineering, software design, and hardware-software integration instead of only software engineering or electronic engineering. Computer engineers are involved in many hardware and software aspects of computing, from the design of individual microcontrollers, microprocessors, personal computers, and supercomputers, to circuit design. This field of engineering not only focuses on how computer systems themselves work but also how they integrate into the larger picture.[2]"),
    Post(52, 22, User("eshgam j", Community("company2")),
        "Usual tasks involving computer engineers include writing software and firmware for embedded microcontrollers, designing VLSI chips, designing analog sensors, designing mixed signal circuit boards, and designing operating systems. Computer engineers are also suited for robotics research, which relies heavily on using digital systems to control and monitor electrical systems like motors, communications, and sensors."),

  ];


  int SelectedPage;
  int listCounter;
  int index;
  final double iconSize = 30;
  TextEditingController inString = TextEditingController();

  _FeedPage(this.SelectedPage);
  List<Widget> pages = [Alerts(), maps(), CreatPage(), dashbord()];

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
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _widget(list[index]);
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
            //onTap: ,
          ),

          ListTile(
            tileColor: Colors.black12,
            title: Text(post.post),
            //onTap: ,
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

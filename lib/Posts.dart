
import 'package:ap_project/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  Post post;

  Posts (this.post, {Key key}) : super(key: key);

  @override
  State<Posts> createState() => _State();
}

class _State extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    var post = widget.post;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Color.fromRGBO(8, 21, 33, 1.0),
          title : Row(
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(left:0),
                child:IconButton(
                  onPressed: (){Navigator.pop(context, MaterialPageRoute(builder: (context) => FeedPage()));
                }, icon:Icon(Icons.arrow_back, color: Colors.white,),),
              ),

              Container(
                margin: EdgeInsets.only(left: 200),
                child:IconButton(onPressed:(){}, icon:Icon(Icons.add_alert_outlined, color: Colors.white,),),
              ),

              Container(
                child:IconButton(onPressed: (){}, icon:Icon(Icons.linear_scale, color: Colors.white,),),
              ),

              SizedBox(width: 10,),
            ],
          ),
        ),

        body: ListView.builder(
            itemCount: post.comments.length,
            itemBuilder: (BuildContext context, int index) {
              return _widget(context,index);
            }),

      ),
        );
  }

  _widget(BuildContext context, int index) {
    var post = widget.post;
    return Container(

      child: Column(
        children: [
          // Container(
          //   child:Column(
          //     children: [
          //       Column(
          //         children: [
          //           Row(
          //               children: [
          //
          //                 Container(
          //                   margin: EdgeInsets.only(left: 10,top: 5,bottom: 5),
          //                   child :CircleAvatar(
          //                     radius: 25,
          //                     child: post.profile,
          //                   ),
          //                 ), //CircleAvatar
          //
          //                 Column(
          //                     children:[
          //                       Container(
          //                         margin: EdgeInsets.only(left: 10,top: 5),
          //                         child: Text(
          //                           post.user.community.name,
          //                           style: TextStyle(
          //                             fontSize: 20,
          //                           ),),
          //                       ),
          //
          //                       Container(
          //                         margin: EdgeInsets.only(left: 10,top: 3),
          //                         child:Text(
          //                           post.user.name,
          //                           style : TextStyle(fontFamily: 'Raleway'),
          //                         ) ,
          //                       )
          //                       ,
          //                     ]
          //                 ) , //Texts
          //
          //               ]
          //           )
          //         ],
          //       ),
          //
          //       ListTile(
          //         tileColor: Colors.black12,
          //         title: Text(post.post,
          //           style: TextStyle(fontFamily: 'Raleway'),
          //         ),
          //       ),
          //
          //       Row(
          //         children: [
          //           Container(
          //             child: IconButton(
          //               icon: Icon(Icons.arrow_upward_rounded,
          //                   color: Colors.black38, size: 25.0),
          //               onPressed: () {
          //                 setState(() {
          //                   post.vote++;
          //                 });
          //               },
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.only(top: 2),
          //             child: Text(
          //               post.vote.toString(),
          //               style: TextStyle(fontSize: 15),
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.only(top: 2),
          //             child: IconButton(
          //                 onPressed: () {
          //                   setState(() {
          //                     post.vote--;
          //                   });
          //
          //                 },
          //                 icon: Icon(
          //                   Icons.arrow_downward_rounded,
          //                   color: Colors.black38,
          //                   size: 25.0,
          //                 )),
          //           ),
          //           Container(
          //               margin: EdgeInsets.only(left: 15, top: 5),
          //               child: IconButton(
          //                 icon: Icon(
          //                   Icons.messenger_outline_outlined,
          //                   color: Colors.black38,
          //                   size: 25.0,
          //                 ),
          //                 onPressed: () {
          //                   setState(() {
          //                     post.comment++;
          //                   });
          //
          //                 },
          //               )),
          //           Container(
          //             margin: EdgeInsets.only(top: 1),
          //             child: Text(
          //               post.comment.toString(),
          //               style: TextStyle(fontSize: 15),
          //             ),
          //           ),
          //           Container(
          //               margin: EdgeInsets.only(left: 18, top: 5),
          //               child: IconButton(
          //                 icon: Icon(
          //                   Icons.share,
          //                   color: Colors.black38,
          //                   size: 25.0,
          //                 ),
          //                 onPressed: () {},
          //               )),
          //           Container(
          //             margin: EdgeInsets.only(top: 5, left: 5),
          //             child: Text(
          //               'Share',
          //               style: TextStyle(fontSize: 15),
          //             ),
          //           ),
          //           Container(
          //               margin: EdgeInsets.only(left: 25, top: 5),
          //               child: IconButton(
          //                 icon: Icon(
          //                   Icons.card_giftcard,
          //                   color: Colors.black38,
          //                   size: 25.0,
          //                 ),
          //                 onPressed: () {},
          //               )),
          //         ],
          //       ),
          //
          //      // Expanded(child: ListView.builder(itemCount:5,itemBuilder: (BuildContext context, int index) {return _widget(context, index);},)),
          //     ],
          //   ),
          // ),

          ListTile(
            leading: CircleAvatar(
              child: post.user.image,
              backgroundColor: Colors.black,
              radius: 25,
            ),
            title: Text(
                post.user.name),
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
                      Icons.reply_sharp,
                      color: Colors.black38,
                      size: 25.0,
                    ),
                    onPressed: () {},
                  )),

              Container(
                margin: EdgeInsets.only(top: 1),
                child: Text(
                  'Reply',
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

              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.linear_scale,
                    color: Colors.black38,
                    size: 25.0,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}

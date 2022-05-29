import 'package:flutter/material.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(57),
        child: AppBar(
          title: Text("Premium",style: TextStyle
            (color: Colors.deepOrange),),
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            height: 700,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/pre.png"),
                    fit: BoxFit.fitHeight)),
          ),
        ],
      )

      );
  }
}

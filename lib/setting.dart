import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(260),
        child: AppBar(
            backgroundColor: Colors.deepOrange,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Setting",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            flexibleSpace: Container(
                padding: EdgeInsets.only(top: 120, left: 20, bottom: 20),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Image(
                        image: AssetImage("assets/logo.png"), //aks ekhtesasi
                        fit: BoxFit.fitHeight,
                      ),
                      backgroundColor: Colors.white,
                      radius: 70,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            "Userrname",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Container(
                            child: MaterialButton(
                              minWidth: 140,
                              height: 40,
                              onPressed: () {},
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Text(
                                "Online",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: MaterialButton(
                              minWidth: 140,
                              height: 40,
                              onPressed: () {},
                              color: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                                side: BorderSide(color: Colors.black, width: 3),
                              ),
                              child: Text(
                                "Edit Avatar",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          MaterialButton(
              minWidth: 400,
              height: 55,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.account_circle_outlined,
                      color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My profile",
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
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.account_balance_outlined,
                      color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Create a community",
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
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.account_balance_wallet_outlined,
                      color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Reddit coins",
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
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.save_alt, color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Saved",
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
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.history, color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "History",
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
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.vpn_key, color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Privacy policy",
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
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.android, color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "About us",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
          MaterialButton(
              minWidth: 400,
              height: 60,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.all_inclusive_rounded, color: Colors.deepOrange, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Get Premium",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}

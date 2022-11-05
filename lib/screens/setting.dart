import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:one_letter/screens/wallet.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              height: 150,
              width: 242,
              alignment: Alignment.center,
              child: Stack(children: [
                Image.asset(
                  "assets/Oval.png",
                  height: 150,
                  width: 242,
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Fawad Kaleem",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
          ),
          Text(
            "fwdkaleem@gmail.com",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            margin: EdgeInsets.only(left: 18),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Account Setting",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => Payment()));
            },
            title: Text(
              "Wallet",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Earn Gold",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Store",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Medal",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Edit Profile",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "LogOut",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

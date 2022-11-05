import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class Chat_Page extends StatelessWidget {
  const Chat_Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset(
          "assets/Oval.png",
          height: 50,
          width: 50,
        ),
        title: Text(
          "Stories",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        actions: [
          Container(
              decoration: BoxDecoration(
                  color: Color(0xff8E8E93).withOpacity(.45),
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
              )),
          SizedBox(
            width: 5,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xff8E8E93).withOpacity(.45),
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit_note_sharp,
                  color: Colors.black,
                ),
              )),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AllChats(),
            ],
          ),
        ),
      ),
    );
  }
}

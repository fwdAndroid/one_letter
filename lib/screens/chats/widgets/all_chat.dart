import '../models/message_model.dart';
import '../screens/chat_room.dart';
import '../screens/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class AllChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ListTile(
          //   leading: Image.asset(
          //     "assets/Oval.png",
          //     height: 50,
          //     width: 50,
          //   ),

          //   trailing: Row(
          //     children: [

          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          Container(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 80, child: Image.asset("assets/Oval.png")),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff8BC83F), shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff8E8E93).withOpacity(.45),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff8E8E93).withOpacity(.45),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.video_call,
                      color: Colors.black,
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff8E8E93).withOpacity(.45),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff8E8E93).withOpacity(.45),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                  )),
              Container(
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: allChats.length,
                itemBuilder: (context, int index) {
                  final allChat = allChats[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return ChatRoom(user: allChat.sender);
                      }));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage(allChat.avatar),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    allChat.sender.name,
                                    style: MyTheme.heading2.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(allChat.text,
                                      style: TextStyle(
                                          color: Color(0xff858585),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  allChat.unreadCount == 0
                                      ? CircleAvatar(
                                          radius: 8,
                                          backgroundColor: Color(0xff2743FD),
                                          child: Text(
                                            allChat.unreadCount.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Text(""),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    allChat.time,
                                    style: MyTheme.bodyTextTime,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ]))),
                  );
                }),
          )
        ],
      ),
    );
  }
}

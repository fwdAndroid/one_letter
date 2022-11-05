import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:one_letter/screens/chats/screens/chat_page.dart';
import 'package:one_letter/screens/hotcommuities.dart';
import 'package:one_letter/screens/live_stream.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ],
          centerTitle: true,
          title: Image.asset(
            "assets/letters1 1.png",
            height: 30,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: 'Streaming',
              ),
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Chat',
              ),
              Tab(
                text: 'Game',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Live_Stream(),
            HotCommunites(),
            Chat_Page(),
            HotCommunites(),
          ],
        ),
      ),
    );
  }
}

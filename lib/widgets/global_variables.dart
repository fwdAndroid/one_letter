// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:instagram/screens/add_post_screen.dart';
// import 'package:instagram/screens/feed_screen.dart';
// import 'package:instagram/screens/profile_screen.dart';
// import 'package:instagram/screens/search_screen.dart';

import 'package:flutter/material.dart';
import 'package:one_letter/screens/chats/screens/screen.dart';
import 'package:one_letter/screens/explorer.dart';
import 'package:one_letter/screens/home.dart';
import 'package:one_letter/screens/live_stream.dart';
import 'package:one_letter/screens/setting.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  Home_Screen(),
  Explore(),
  Live_Stream(),
  Chat_Page(),
  Setting(),

  // Profile()
  //  Random(),
  //  ChatPage(),
  //  Profile(),
];

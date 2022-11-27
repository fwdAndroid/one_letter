import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_letter/screens/add_post_screen.dart';
import 'package:one_letter/screens/feed_screen.dart';
import 'package:one_letter/screens/profile_screen.dart';
import 'package:one_letter/screens/search_screen.dart';
import 'package:one_letter/utils/chat.dart';

const webScreenSize = 600;

List<Widget> homeScreenSize = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Chat(),
  ProfileScreen(uid:FirebaseAuth.instance.currentUser!.uid,)
];

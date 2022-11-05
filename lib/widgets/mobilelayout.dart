import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:one_letter/widgets/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: homeScreenItems),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.red),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              label: 'Explorer',
              icon: Icon(
                Icons.explore,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                "assets/ss.png",
                height: 35,
                width: 35,
              )),
          BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(
                Icons.bubble_chart,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
    // return Scaffold(
  
    //   bottomNavigationBar: BottomNavyBar(
    //     onTap: navigationTapped,
    //     items: [
    //       // backgroundColor: primaryColor,

    //       BottomNavyBarItem(
    //         icon: Image.asset(
    //           _page == 0 ? 'asset/homered.png' : "asset/home.png",
    //           width: 50,
    //           height: 30,
    //         ),
    //       ),
    //       BottomNavyBarItem(
    //         icon: Image.asset(
    //           _page == 1 ? 'asset/gridred.png' : "asset/grid.png",
    //           width: 50,
    //           height: 30,
    //         ),
    //       ),
    //       BottomNavyBarItem(
    //         icon: Image.asset(
    //           _page == 2 ? 'asset/chatred.png' : "asset/chat.png",
    //           width: 50,
    //           height: 30,
    //         ),
    //       ),
    //       BottomNavyBarItem(
    //         icon: Image.asset(
    //           _page == 3 ? 'asset/profile.png' : "asset/profile.png",
    //           width: 50,
    //           height: 30,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
 
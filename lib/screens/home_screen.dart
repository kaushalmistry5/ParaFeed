import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parafeed/common/app_color.dart';
import 'package:parafeed/common/custom_widgets.dart';
import 'package:parafeed/common/textstyle.dart';
import 'package:parafeed/screens/fragments/feeds_screen.dart';

import '../common/app_assets.dart';
import 'fragments/profile_screen.dart';
import 'fragments/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 5,
          children: [
            CustomWidgets.customIcon(iconData: AppIcons.appLogo),
            Text("ParaFeed", style: mediumTextStyle(fontSize: 24,color: primary),),
          ],
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: mediumTextStyle(fontSize: 14,color: primary),
          unselectedLabelStyle: mediumTextStyle(fontSize: 14,color: Colors.grey),
          backgroundColor: Colors.white,
          enableFeedback: true,
          currentIndex: currentIndex,
          elevation: 5,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ]
      ),
    );
  }


}

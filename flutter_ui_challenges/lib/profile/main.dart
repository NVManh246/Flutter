import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/profile/main_menu.dart';
import 'package:flutter_ui_challenges/profile/profile_colors.dart';
import 'package:flutter_ui_challenges/profile/profile_header.dart';
import 'package:flutter_ui_challenges/profile/profile_icons.dart';
import 'package:flutter_ui_challenges/profile/quick_action.dart';
import 'models.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile",
      home: ProfileHomePage(),
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iconColor = new Color(0xFFCCCCCC);

    final navigationItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.home, color: iconColor), title: Text("")),
      BottomNavigationBarItem(
          icon: Icon(
            LineAwesomeIcons.bookmark,
            color: iconColor,
          ),
          title: Text("")),
      BottomNavigationBarItem(
          icon: Icon(
            LineAwesomeIcons.thumbsUp,
            color: iconColor,
          ),
          title: Text("")),
      BottomNavigationBarItem(
          icon: Icon(
            LineAwesomeIcons.user,
            color: ProfileColors.primaryColor,
          ),
          title: Text(""))
    ];

    final profile = getProfile();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          ProfileHeader(profile),
          QuickActions(),
          MainMenu()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: navigationItems,
        onTap: (index) {},
        fixedColor: ProfileColors.primaryColor,
        iconSize: 25.0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

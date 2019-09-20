import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/profile/models.dart';
import 'package:flutter_ui_challenges/profile/profile_colors.dart';
import 'package:flutter_ui_challenges/profile/profile_fonts.dart';
import 'package:flutter_ui_challenges/profile/profile_icons.dart';

class ProfileHeader extends StatelessWidget {
  final Profile profile;

  ProfileHeader(this.profile);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    final headerGradient = RadialGradient(
        center: Alignment.topLeft,
        radius: 0.4,
        colors: <Color>[
          const Color(0xFF8860EB),
          const Color(0xFF8881EB),
        ],
        stops: <double>[0.4, 1.0],
        tileMode: TileMode.repeated);

    const headerHeight = 290.0;

    return Container(
      height: headerHeight,
      decoration: BoxDecoration(
          color: ProfileColors.primaryColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                spreadRadius: 2.0,
                blurRadius: 4.0,
                offset: Offset(0.0, 1.0),
                color: Colors.black38)
          ]),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: headerHeight,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              const Color(0xFF7928D1),
              const Color(0xFF9A4DFF)
            ], stops: <double>[
              0.3,
              0.5
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          ),
          CustomPaint(
            painter: HeaderGradientPainter(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: topPadding, left: 15.0, right: 15.0, bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildBellIcon(),
                new Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: _buildTitle(),
                ),
                new Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: _buildAvatar(),
                ),
                _buildFollowerStats(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBellIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(
            LineAwesomeIcons.bell,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildTitle() {
    return new Text("Profile",
        style: new TextStyle(
            fontFamily: ProfileFontNames.TimeBurner,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 40.0,
            letterSpacing: 1.0));
  }

  Widget _buildAvatar() {
    final mainTextStyle = TextStyle(
        fontFamily: ProfileFontNames.TimeBurner,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20.0);
    final subTextStyle = TextStyle(
        fontFamily: ProfileFontNames.TimeBurner,
        fontSize: 16.0,
        color: Colors.white70,
        fontWeight: FontWeight.w700);

    return Row(
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/ttg.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26, blurRadius: 5.0, spreadRadius: 1.0)
              ]),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              profile.fullName,
              style: mainTextStyle,
            ),
            Text(
              profile.location,
              style: subTextStyle,
            )
          ],
        )
      ],
    );
  }

  Widget _buildFollowerStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildFollowerStat("Followers", profile.numberOfFollowersString),
        _buildVerticalDivider(),
        _buildFollowerStat("Following", profile.numberFollowingString),
        _buildVerticalDivider(),
        _buildFollowerStat("Total Likes", profile.totalLikesString),
      ],
    );
  }

  Widget _buildFollowerStat(String title, String value) {
    final titleStyle = new TextStyle(
        fontSize: 16.0,
        fontFamily: ProfileFontNames.TimeBurner,
        color: Colors.white);
    final valueStyle = new TextStyle(
        fontFamily: ProfileFontNames.TimeBurner,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: Colors.white);
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(title, style: titleStyle),
        new Text(value, style: valueStyle),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return new Container(
      height: 30.0,
      width: 1.0,
      color: Colors.white30,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}

class HeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

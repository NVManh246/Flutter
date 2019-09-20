import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/profile/profile_fonts.dart';

class QuickActions extends StatelessWidget {
  final blueGradien = const LinearGradient(colors: const <Color>[
    const Color(0xFF0075D1),
    const Color(0xFF00A2E3),
  ], stops: const <double>[
    0.4,
    0.6
  ], begin: Alignment.topRight, end: Alignment.bottomLeft);

  final purpleGraient = const LinearGradient(
      colors: const <Color>[const Color(0xFF882DEB), const Color(0xFF9A4DFF)],
      stops: const <double>[0.5, 0.7],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  final redGradient = const LinearGradient(colors: const <Color>[
    const Color(0xFFBA110E),
    const Color(0xFFCF3110),
  ], stops: const <double>[
    0.6,
    0.8
  ], begin: Alignment.bottomRight, end: Alignment.topLeft);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 120),
      margin: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 10, bottom: 20, right: 10, top: 10),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _buildAction("Live\nBroadcast", (){}, Colors.blue, blueGradien,
            AssetImage("assets/images/microphone.png")),
            _buildAction(
                "My\nWallet", () {}, Colors.purple, purpleGraient,
                new AssetImage("assets/images/wallet.png")),
            _buildAction(
                "Game\nCenter", () {}, Colors.red, redGradient,
                new AssetImage("assets/images/joystick.png")),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(String title, VoidCallback action, Color color,
      Gradient gradient, ImageProvider backgroundImage) {
    final textStyle = new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 18.0,
        fontFamily: ProfileFontNames.TimeBurner);

    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.only(right: 5.0, left: 5.0),
        width: 150,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 2, spreadRadius: 1, offset: Offset(0, 0.1))
          ],
          gradient: gradient,
        ),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Transform.rotate(
                  angle: -pi / 4.8,
                  alignment: Alignment.centerRight,
                  child: ClipPath(
                    clipper: _BackgroundImageClipper(),
                    child: Container(
                      padding:
                          const EdgeInsets.only(bottom: 20, right: 0, left: 60),
                      child: Image(
                        width: 90,
                        height: 90,
                        image: backgroundImage != null
                            ? backgroundImage
                            : AssetImage("assets/images/microphone.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(title, style: textStyle),
            )
          ],
        ),
      ),
    );
  }
}

class _BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = new Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}

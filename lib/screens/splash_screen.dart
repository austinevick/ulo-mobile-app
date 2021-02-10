import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ulo_mobile_spa/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Timer timer;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1050));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    init();
    super.initState();
  }

  init() {
    timer = Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx) => AuthenticationScreen(),
            )));
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: animation,
            child: Image.asset(
              'images/ulo_logo.png',
            ),
          ),
        ],
      ),
    );
  }
}

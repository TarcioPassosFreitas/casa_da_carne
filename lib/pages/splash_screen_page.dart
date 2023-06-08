import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'dart:async';
import 'bottom_nav_bar.dart';
import 'nointernet_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => NoInternetPage(child: BottomNavBar()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF22231E),
        child: Center(
          child: ScaleAnimatedWidget.tween(
            duration: Duration(seconds: 4),
            scaleDisabled: 0.3,
            scaleEnabled: 1.2,
            child: Image.asset('lib/assets/icon/icone.png'),
          ),
        ),
      ),
    );
  }
}

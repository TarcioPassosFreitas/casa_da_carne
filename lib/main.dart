import 'package:flutter/material.dart';
import 'pages/nointernet_page.dart';
import 'pages/splash_screen_page.dart';

void main() {
  runApp(CasaDeCarnesApp());
}

class CasaDeCarnesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casa de Carnes',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: NoInternetPage(child: SplashScreen()),
    );
  }
}

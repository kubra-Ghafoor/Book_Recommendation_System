import 'dart:async';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900], 
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
           
            Image.asset(
              'images/logo.png', 
              width: 155, 
              height: 155, 
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white), 
            ),
          ],
        ),
      ),
    );
  }
}

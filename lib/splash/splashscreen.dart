import 'dart:async';

import 'package:floral/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 7),
        () =>
         Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login_Screen())
              )
            );
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Color(0xffFFE2E6),
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          Image.asset('assets/logo.png')
      ],
     ),
   ); 
  }
}
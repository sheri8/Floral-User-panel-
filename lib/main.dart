import 'package:firebase_core/firebase_core.dart';
import 'package:floral/authentication/signup.dart';
import 'package:floral/main/main_screen.dart';
import 'package:floral/splash/splashscreen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            // SignUp()
            MainScreen()
        // SplashScreen(),
        );
  }
}

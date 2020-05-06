import 'package:flutter/material.dart';
import 'package:shop_app_2/pages/home.dart';
import 'package:shop_app_2/pages/signup.dart';
import './pages/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,   
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context)=> new MyApp(),
        '/signup': (BuildContext context)=> new SignUp(),
        '/homepage': (BuildContext context)=> new HomePage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testapp/screens/Signin.dart';
import 'package:testapp/screens/Signup.dart';
import 'package:testapp/screens/Dashboard.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(

      ),
      initialRoute: Signin.id,
      routes: {
        Signin.id: (context) => Signin(),
        Signup.id: (context) => Signup(),
        Dashboard.id: (context) => Dashboard(),

      },
    );
  }
}



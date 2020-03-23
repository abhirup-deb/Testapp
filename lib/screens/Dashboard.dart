import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  static const String id = 'Dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),centerTitle: true,),
      body: Center(child: Container(child: Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 70.0),),)),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseUser LoggedInuser;

class Dashboard extends StatefulWidget{
  static const String id = 'Dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();

  }
  void getCurrentUser()async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        LoggedInuser = user;
        print(LoggedInuser.email);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),centerTitle: true,),
      body: Center(child: Container(child: Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 70.0),),)),
    );
  }
}


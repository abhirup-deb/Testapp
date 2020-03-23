import 'package:flutter/material.dart';
import 'package:testapp/screens/Dashboard.dart';
import 'package:testapp/screens/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Signin extends StatefulWidget{
  static const String id = 'Signin';
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin>{

  final _auth = FirebaseAuth.instance;
  String _pass;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signin'),centerTitle: true,),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: 450.0,
          width: 350.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(27.0),color: Colors.black12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(height: 70.0,width:240.0,
                    child: TextField(style: TextStyle(color: Colors.white70),onChanged: (value) {
                      _email = value;
                    },keyboardType:TextInputType.emailAddress,textAlign: TextAlign.center,decoration: InputDecoration(
                        hintText: 'Enter Your Email',hintStyle: TextStyle(color: Colors.blueGrey)
                    ),)),
                SizedBox(
                  height: 3.0,
                ),
                Container(height: 70.0,width:240.0,
                    child: TextField(style: TextStyle(color: Colors.white70),obscureText:true,keyboardType: TextInputType.visiblePassword,onChanged: (value) {
                      _pass = value;
                    },textAlign: TextAlign.center,decoration: InputDecoration(
                        hintText: 'Enter Your Password',hintStyle: TextStyle(color: Colors.blueGrey)
                    ),)),
                SizedBox(height: 4.0,),
                RaisedButton(onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: _email.trim(), password: _pass.trim());
                    if (user != null) {
                      Navigator.pushNamed(context, Dashboard.id);
                    }
                  }
                  catch (e) {
                    print(e);
                  }
                },
                  child: Text('Login',style: TextStyle(fontSize: 20.0),),color: Colors.orangeAccent,elevation: 7.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38.0),),),

                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("New to this App?  You can"),
                    SizedBox(
                      width: 4.0,
                    ),
                    GestureDetector(
                      child: Text("SignUp",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w900,fontSize: 17.0,decoration: TextDecoration.underline,decorationThickness: 2.5,),),
                      onTap: () {
                          Navigator.pushNamed(context, Signup.id);
                      },
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text("Here"),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

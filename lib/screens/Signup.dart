import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/screens/Signin.dart';
import 'package:flushbar/flushbar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const apikey ='34.93.21.176/signup';






class Signup extends StatefulWidget{
  static const String id = 'Signup';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup>{
  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool digit = false;
  bool found = false;
  String _name;
  String _pass;
  String _email;
  double lat;
  double long;
  Position position;



  void getLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    print(position);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Registration"),leading: Container(child: IconButton(icon: Icon(Icons.home), onPressed: () => Navigator.pushNamed(context, Signin.id)),),),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: 450.0,
          width: 350.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(27.0),color: Colors.black12),
          child: ListView(
            children: <Widget>[
              Container(height: 70.0,width:240.0,
                  child: TextField(style: TextStyle(color: Colors.white70),onChanged: (value){_name=value;},textAlign: TextAlign.center,decoration: InputDecoration(
                    hintText: 'Enter Your Name',hintStyle: TextStyle(color: Colors.blueGrey,),errorText: _validate1?"Please Fill up this Field":null,
                  ),)),

              SizedBox(
                height: 3.0,
              ),

              Container(height: 70.0,width:240.0,
                  child: TextField(style: TextStyle(color: Colors.white70),onChanged: (value){_email=value;},keyboardType: TextInputType.emailAddress,textAlign: TextAlign.center,decoration: InputDecoration(
                    hintText: 'Enter Your Email',hintStyle: TextStyle(color: Colors.blueGrey),errorText: _validate2?"Please Fill up this Field":null,
                  ),)),
              SizedBox(
                height: 3.0,
              ),

              Container(height: 70.0,width:240.0,
                  child: TextField(style: TextStyle(color: Colors.white70),onChanged: (value){_pass=value;},keyboardType: TextInputType.visiblePassword,textAlign: TextAlign.center,decoration: InputDecoration(
                      hintText: 'Enter Your Password',hintStyle: TextStyle(color: Colors.blueGrey),errorText: _validate3?"Please Fill up this Field":null,
                  ),)),
              SizedBox(
                height: 3.0,
              ),
              Container(height: 70.0,width:240.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Get Current Location',style: TextStyle(color: Colors.white70,textBaseline: TextBaseline.alphabetic,fontSize: 20.0,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                      SizedBox(
                        width: 3.0,
                      ),
                      RaisedButton (child: Icon(Icons.location_on),onPressed: ()async{

                          await getLocation();
                          print(lat);
                          print(long);

                      },),
                    ],
                  )),
              SizedBox(
                height: 3.0,
              ),

              SizedBox(height: 4.0,),
              Center(
                child: RaisedButton(onPressed: () async{
                  setState(() {
                    _name.isEmpty?_validate1=true:_validate1=false;
                    _email.isEmpty?_validate2=true:_validate2=false;
                    _pass.isEmpty?_validate3=true:_validate3=false;
                    if(_pass.length>=8){
                      print(_pass);
                      digit = true;
                    }
                    else{
                      print(_pass);
                      Flushbar(
                        message: "Enter a 8 digit Password",
                        icon: Icon(
                          Icons.info,
                          size: 20.0,
                          color: Colors.red[500],
                        ),
                        duration: Duration(seconds: 5),
                        leftBarIndicatorColor: Colors.red[200],
                      )..show(context);
                    }
                    if(lat!=null){
                      found = true;
                    }
                    else{
                      Flushbar(
                        message: "Get the Current location",
                        icon: Icon(
                          Icons.info,
                          size: 20.0,
                          color: Colors.red[500],
                        ),
                        duration: Duration(seconds: 5),
                        leftBarIndicatorColor: Colors.red[200],
                      )..show(context);
                    }
                  });
                  if(_validate1==false && _validate2==false && _validate3==false && digit==true && lat!=null) {

                    var response = await http.get(apikey);
                    if (response.statusCode == 200) {
                      response = await http.post(apikey,body:{'emailid': '_email', 'password': '_pass'});
                    } else {
                      print('Request failed with status: ${response.statusCode}.');
                    }

                    Navigator.pushNamed(context,Signin.id);

                  }
                },
                  child: Text('Register',style: TextStyle(fontSize: 20.0),),color: Colors.teal,elevation: 7.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38.0),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
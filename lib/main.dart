import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AdminPage.dart';
import 'MemberPage.dart';
import 'package:testing_app/Animation/FadeAnimation.dart';
// import 'package:day14/Animation/FadeAnimation.dart';


void main() {
  runApp(MyApp());
}

String username='';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return new MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Login PHP My Admin',
      theme:new ThemeData(scaffoldBackgroundColor: const Color(0xBEFFFFFF)),
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/AdminPage': (BuildContext context)=> new AdminPage(username: username,),
        '/MemberPage': (BuildContext context)=> new MemberPage(username: username,),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';
  bool hidePassword = true;
  void openDialog(BuildContext context, String dialogTitle, String dialogContent){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: new Text(dialogTitle),
            content: new Text(dialogContent),
            actions: <Widget>[
              new FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: new Text ('Back')
              )

            ],

          );
        }
    );
  }

  Future<List> _login() async {
    try{
      // final response = await http.post(Uri.parse("http://192.168.254.108/my_store/login.php"), body: {
      final response = await http.post(Uri.parse("http://192.168.254.101/my_store/login.php"), body: {
        "username": user.text,
        "password": pass.text,
      });
      var datauser = json.decode(response.body);

      if(datauser.length==0){
        setState(() {
          msg="Login Fail";
          openDialog(context, 'Login Fail',"Make sure your username and password are correct!");
        });
      }else{
        if(datauser[0]['level']=='admin'){
          Navigator.pushReplacementNamed(context, '/AdminPage');
        }else if(datauser[0]['level']=='member'){
          Navigator.pushReplacementNamed(context, '/MemberPage');
        }

        setState(() {
          username= datauser[0]['username'];
        });

      }
      return datauser;
    }
      on Exception catch (exception) {
        openDialog(context, 'Login Fail',"Please check your internet connection");
    } catch (error) {
      openDialog(context, 'Login Fail',"Please check your internet connection");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Logo Here", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Company Name", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        FadeAnimation(1.4, Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  controller: user,
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  controller: pass,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 40,),
                        FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 40,),
                        FadeAnimation(1.6,

                            ButtonTheme(

                              buttonColor: const Color(0xFFFF5800),
                              minWidth: 110.0,
                              height: 50.0,


                              child: RaisedButton(
                                onPressed: () {
                                  _login();
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),

                                child: Text("Access", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            ),

                        //     RaisedButton(
                        //
                        //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0 ),
                        //   onPressed: (){
                        //     _login();
                        //   },
                        //   child: Center(
                        //     child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        //
                        //     ),
                        //
                        //   ),
                        //
                        //
                        // )
                        ),
                        SizedBox(height: 50,),
                        FadeAnimation(1.7, Text("Information about this App", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeAnimation(1.8, Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue
                                ),
                                child: Center(
                                  child: Text("Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: FadeAnimation(1.9, Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black
                                ),
                                child: Center(
                                  child: Text("Config", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testing_app/screens/google_map_screen.dart';
// import 'dart:async';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


class AdminPage extends StatelessWidget {
  // AdminPage(): super();
  // final String title =

  AdminPage({this.username});
  final String username;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Welcome Admin"),),
  //     body: Column(
  //       children: <Widget>[
  //         Text('Hallo $username', style: TextStyle(fontSize: 20.0),),
  //
  //         RaisedButton(
  //           child: Text("Signout"),
  //           onPressed: (){
  //             Navigator.pushReplacementNamed(context,'/MyHomePage');
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapping',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:HomePage(),
    );
  }


// class MapsDemoState extends State <MapsDemo>{
//
// }
}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Macky App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Google Map',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:()=> Navigator.push(context, MaterialPageRoute(
            builder: (context) =>GoogleMapScreen(),
          )
          ),
          tooltip: 'Google Map',
          child: Icon(Icons.pin_drop_outlined),
        )
    );
  }
}
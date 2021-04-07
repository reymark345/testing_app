import 'package:flutter/material.dart';
import 'package:testing_app/screens/google_map_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'main.dart';

class AdminPage extends StatelessWidget {

  AdminPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapping',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  HomePage createState() => HomePage();
}

Widget _content = Container();
Color color = Colors.deepPurple;
class HomePage extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: color,
      body: _content,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: color,
        items: [
          Icon(Icons.home),
          Icon(Icons.dashboard),
          Icon(Icons.settings)
        ],
        onTap: (index){
          setState(() {
            if (index ==0){
              _content = Container();
            }
            else if (index ==1){
              _content = GoogleMapScreen();
            }
            else{

            }
          });
        },
      ),
    );
  }
}

// Color color = Colors.deepOrangeAccent;
// String disp ='';
// class HomePage extends State<MyHomePage>{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: color,
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: color,
//         items: [
//           Icon(Icons.home),
//           Icon(Icons.dashboard),
//           Icon(Icons.settings)
//         ],
//         onTap: (index){
//           setState(() {
//             if (index ==0){
//               disp = 'Home';
//               color = Colors.blueGrey;
//             }
//             else if (index ==1){
//               disp = 'Dashboard';
//               color = Colors.orange;
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) =>GoogleMapScreen(),
//               ),);
//             }
//             else{
//               disp = 'Settings';
//               color = Colors.green;
//
//             }
//
//           });
//         },
//       ),
//     );
//
//   }
// }

// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Macky App'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Google Map',
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed:()=> Navigator.push(context, MaterialPageRoute(
//             builder: (context) =>GoogleMapScreen(),
//           )
//           ),
//           tooltip: 'Google Map',
//           child: Icon(Icons.pin_drop_outlined),
//         )
//     );
//   }
// }
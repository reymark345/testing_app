import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert' show utf8, LineSplitter;

class GoogleMapScreen extends StatefulWidget{
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}
class _GoogleMapScreenState extends State<GoogleMapScreen>{
  Set<Marker> _markers = {};
  String details='Lot 20 BLK 10';
  // final lines = const LineSplitter().convert(utf8.decode(vals));
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'),
          position:  LatLng(8.9405, 125.5364),
          infoWindow: InfoWindow(
            title: r'This is my house' ,
            snippet: details,

          )
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Text('Google Map API'),
        ),
        body:Padding(
            padding: EdgeInsets.only(bottom: 16.0),

            child: GoogleMap(
              onMapCreated:  _onMapCreated,

              polygons: myPolygon(), markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition:CameraPosition(target: LatLng(8.9405, 125.5364),
                zoom: 15,
            ))
        ),
    );
  }

  Set<Polygon> myPolygon() {
    List<LatLng> polygonCoords = new List();
    polygonCoords.add(LatLng(8.9442, 125.5321));
    polygonCoords.add(LatLng(8.9486, 125.5364));
    polygonCoords.add(LatLng(8.9303, 125.5384));
    polygonCoords.add(LatLng(8.9442, 125.5321));

    Set<Polygon> polygonSet = new Set();
    polygonSet.add(Polygon(
        polygonId: PolygonId('test'),
        points: polygonCoords,
        fillColor: Colors.red.withOpacity(0.2),
        strokeColor: Colors.yellowAccent.withOpacity(0.3)));
    return polygonSet;
  }

}
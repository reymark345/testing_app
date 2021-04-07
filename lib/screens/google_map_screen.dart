import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget{
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}
class _GoogleMapScreenState extends State<GoogleMapScreen>{
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'),
          position:  LatLng(39.9042, 116.4074),
          infoWindow: InfoWindow(
            title: 'Sample Marker',
            snippet: 'A secret Place',
          )
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('API MAP'),

        ),

        body:Padding(
            padding: EdgeInsets.only(bottom: 16.0),


            child : GoogleMap(
                onMapCreated:  _onMapCreated,
                markers: _markers,
                initialCameraPosition: CameraPosition(target: LatLng(39.9042, 116.4074),
                  zoom: 15,
                ))),

        // body: GoogleMap(
        //     onMapCreated:  _onMapCreated,
        //     markers: _markers,
        //     initialCameraPosition: CameraPosition(target: LatLng(39.9042, 116.4074),
        //       zoom: 15,
        //     ))

    );
  }
}
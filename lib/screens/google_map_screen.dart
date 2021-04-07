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
          position:  LatLng(8.9475, 125.5406),
          infoWindow: InfoWindow(
            title: 'Mackys house',
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
          title: Text('Google Map'),
        ),
        body: GoogleMap(
            onMapCreated:  _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(target: LatLng(8.9475, 125.5406),
              zoom: 15,
            ))

    );
  }
}
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
          position:  LatLng(-17.815450600, -63.185252100),
          infoWindow: InfoWindow(
            title: r'Mackys house' ,
            snippet: r'A secret Place',
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
            // child : GoogleMap(
            //     onMapCreated:  _onMapCreated,
            //     markers: _markers,
            //     initialCameraPosition: CameraPosition(target: LatLng(8.9475, 125.5406),
            //       zoom: 15,
            //     ))

            child : GoogleMap(
                onMapCreated:  _onMapCreated,
                markers: _markers,

                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(target: LatLng(-17.815450600, -63.185252100),
                  zoom: 15,
                ))

        ),

    );
  }

  bool _checkIfValidMarker(LatLng tap, List<LatLng> vertices) {
    int intersectCount = 0;
    for (int j = 0; j < vertices.length - 1; j++) {
      if (rayCastIntersect(tap, vertices[j], vertices[j + 1])) {
        intersectCount++;
      }
    }

    return ((intersectCount % 2) == 1); // odd = inside, even = outside;
  }

  final Set<Polygon> _polygons = {};
  List<LatLng> _area = [
    LatLng(-17.770992200, -63.207739700),
    LatLng(-17.776386600, -63.213576200),
    LatLng(-17.778348200, -63.213576200),
    LatLng(-17.786848100, -63.214262900),
    LatLng(-17.798289700, -63.211001300),
    LatLng(-17.810547700, -63.200701600),
    LatLng(-17.815450600, -63.185252100),
    LatLng(-17.816267800, -63.170660900),
    LatLng(-17.800741300, -63.153838100),
    LatLng(-17.785867400, -63.150919800),
    LatLng(-17.770501800, -63.152636400),
    LatLng(-17.759712400, -63.160361200),
    LatLng(-17.755952300, -63.169802600),
    LatLng(-17.752519100, -63.186625400),
    LatLng(-17.758404500, -63.195551800),
    LatLng(-17.770992200, -63.206538100),
    LatLng(-17.770996000, -63.207762500)];

  bool rayCastIntersect(LatLng tap, LatLng vertA, LatLng vertB) {
    double aY = vertA.latitude;
    double bY = vertB.latitude;
    double aX = vertA.longitude;
    double bX = vertB.longitude;
    double pY = tap.latitude;
    double pX = tap.longitude;

    if ((aY > pY && bY > pY) || (aY < pY && bY < pY) || (aX < pX && bX < pX)) {
      return false; // a and b can't both be above or below pt.y, and a or
      // b must be east of pt.x
    }

    double m = (aY - bY) / (aX - bX); // Rise over run
    double bee = (-aX) * m + aY; // y = mx + b
    double x = (pY - bee) / m; // algebra is neat!

    return x > pX;
  }
}
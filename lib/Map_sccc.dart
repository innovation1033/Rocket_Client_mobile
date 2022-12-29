import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapErorr extends StatelessWidget {
  GoogleMapController? googleMapController;
  @override
  Widget build(BuildContext context) {

    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(30.033594358488667, 31.21179660381268),zoom: 18),
      onMapCreated: (GoogleMapController controller) {
        googleMapController = controller;
      },);
  }
}

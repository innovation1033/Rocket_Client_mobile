import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;
import 'package:bloc/bloc.dart';
import 'package:client_rocket/presentation/home_layot/profile_screens/map/distance_model.dart';
import 'package:client_rocket/resource/constants_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {

  MapCubit() : super(MapInitial());

  static MapCubit get(context) => BlocProvider.of(context);
  //////////////////////////////Maps/////////////////////////////////
  StreamSubscription? streamSubscription;
  GoogleMapController? googleMapController;
  List<LatLng> polyLineCoordinates=[];
  Set<Polyline>? allPolyLine;
  LatLng startLocation=LatLng(30.033594358488667, 31.21179660381268);
  LatLng destinationLocation=LatLng(30.064480046344848, 31.260768683669674);
  Location liveLocation = Location();
  LocationData? currentLocation;
  Marker? myMarker;
  Circle? mycircle;
  BitmapDescriptor? currentLocationIcon;
  DistanceModel? distanceModel;
  double? latitude;
  double? longitude;
  var name;
  Future <void> getUser({docName}) async {
  await  FirebaseFirestore.instance
        .collection("location")
        .doc('$docName')
        .get()
        .then(
          (res) {
           latitude = res["latitude"];
           longitude = res["longitude"];
           name = res["name"];
          log("1111111111>${latitude},${longitude},${name}");
           googleMapController!.animateCamera(
               CameraUpdate.newCameraPosition(
                   CameraPosition(target: LatLng(latitude!,longitude!), zoom: 18)
               )
           );
          emit(SucessUpdateMarker());
      },

      onError: (e) => print("Error completing: $e"),
    );
    // setState(() {});
  }

  void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/images/hatchback.png",)
        .then((icon) {
        currentLocationIcon=icon;
              }
    );
    emit(SucessgetImageMarker());
  }

  void getCurrentLoc() {
    Location location =Location();
    location.getLocation().then((location) {
      currentLocation=location;
    });
    location.onLocationChanged.listen((newLoc) {
      currentLocation=newLoc;
      googleMapController!.animateCamera(
          CameraUpdate
              .newCameraPosition(
              CameraPosition(
                  zoom: 13,
                  target: LatLng(newLoc.latitude!,newLoc.longitude!))
          ));
      emit(SucessGetCurrentLocation());
    });
    emit(SucessGetCurrentLocation());
  }


  void setGooglePolyLine({startLocation,distnationLocation}) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(GOOGLE_APIKEY,
      PointLatLng(double.parse(startLocation[0]),double.parse(startLocation[1])),
      PointLatLng(double.parse(distnationLocation[0]),double.parse(distnationLocation[1])),
    );
    if (result.points.isNotEmpty) {
      log("path");
      for (var point in result.points) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
        emit(SucessGetpolyLineCoordinates());
      }
    } else {
      log("can't find path");
      emit(ErorrGetpolyLineCoordinates());
    }
  }

  void getDistanceMatrix() async {
    try {
      var response = await Dio().get('https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${startLocation.latitude},${startLocation.longitude}&origins=${destinationLocation.latitude},${startLocation.longitude}&key=${GOOGLE_APIKEY}');
      distanceModel=DistanceModel.fromJson(response.data);
      print(distanceModel!.rows![0].elements![0].distance!.text);
    } catch (e) {
      print(e);
    }
  }
}

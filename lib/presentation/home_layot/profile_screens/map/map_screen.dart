import 'package:client_rocket/presentation/home_layot/profile_screens/map/map_cubit.dart';
import 'package:client_rocket/resource/colors_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  List? startMap,distnationMap,Map;
  int? representativeID;

  MapScreen({this.startMap, this.distnationMap,this.representativeID});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MapCubit,MapState>(
      builder: (context, state) {
        var cuibt=MapCubit.get(context);
        return  Scaffold(
          body: cuibt.currentLocationIcon==null?
          Center(child: Text("Loading..."))
              : StreamBuilder(
            stream: FirebaseFirestore.instance.collection('location').doc("${widget.representativeID}").snapshots(),
            builder: (context,AsyncSnapshot snapshot)
            {
                if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              return GoogleMap(
                initialCameraPosition: CameraPosition(target:snapshot.data!=null? LatLng(snapshot.data!['latitude'], snapshot.data!['longitude']): LatLng(double.parse(widget.startMap![0]), double.parse(widget.startMap![1])),zoom: 18),
                onMapCreated: (GoogleMapController controller) {
                  cuibt.googleMapController = controller;
                },
                  markers: {
                  Marker(markerId: MarkerId("currentLocatonID"),
                    position:snapshot.data!=null? LatLng(snapshot.data!['latitude'],snapshot.data!['longitude'])
                        : LatLng(double.parse(widget.startMap![0]), double.parse(widget.startMap![1])),
                    icon: cuibt.currentLocationIcon!,
                  ),
                  Marker(markerId: MarkerId("StartMap"),
                      position: LatLng(double.parse(widget.startMap![0]), double.parse(widget.startMap![1]))
                  ),
                  Marker(markerId: MarkerId("endMap"),
                    position:   LatLng(double.parse(widget.distnationMap![0]), double.parse(widget.distnationMap![1])),),
                },
                       polylines:{
                         Polyline(
                      polylineId: PolylineId(cuibt.destinationLocation.latitude.toString()),
                      width: 6,
                      visible: true,
                      color:ColorManager.primaryColor,
                      consumeTapEvents: true,
                      startCap: Cap.roundCap,
                      endCap: Cap.roundCap,
                      points: cuibt.polyLineCoordinates //? list of  LatLng

                  )},
                zoomControlsEnabled: false,
              );
            },
          ),
          floatingActionButton: IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {
              cuibt.getUser(docName:"${widget.representativeID}");
            },
          ),
         /* floatingActionButton: BlocBuilder<ShipForCompanyAppCubitClass, ShipStates>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(Icons.location_searching),
                onPressed: () {
                 cuibt.getUser(docName:"${widget.representativeID}");
                },
              );
            },
          ),*/
        );
      },
    );

  }

  @override
  void initState() {
    MapCubit.get(context).polyLineCoordinates=[];
    MapCubit.get(context).setGooglePolyLine(startLocation:widget.startMap,distnationLocation:widget.distnationMap);
  }
}
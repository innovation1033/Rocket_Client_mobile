part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class SucessGetCurrentLocation extends MapState{}

class ErorrGetCurrentLocation extends MapState{}

class SucessUpdateMarkerAndCircle extends MapState{}

class SucessGetpolyLineCoordinates extends MapState{}

class ErorrGetpolyLineCoordinates extends MapState{}

class SucessgetImageMarker extends MapState{}

class SucessUpdateMarker extends MapState{}


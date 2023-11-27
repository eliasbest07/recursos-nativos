import 'dart:async';
// import 'dart:html';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final mapControllerProvider = StateNotifierProvider.autoDispose<MapControllerNotifier, MapState> ((ref) => MapControllerNotifier());

class MapState {
  final bool isReady;
  final bool followUser;
  final List<Marker> markers;
  final GoogleMapController? controller;

  MapState({
    this.isReady = false, 
    this.followUser = false,
    this.markers = const [], this.controller});

  Set<Marker> get markerSet {
    return Set.from(markers);
  }


  MapState copyWith({
    bool? isReady,
    bool? followUser,
    List<Marker>? markers,
    GoogleMapController? controller,
  }) {
    return MapState(
      isReady: isReady ?? this.isReady,
      followUser: followUser ?? this.followUser,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
    );
  }
}

class MapControllerNotifier extends StateNotifier<MapState>{
  StreamSubscription? subscription;
  (double,double)? lastLocation;
  Stream<(double, double)> trackUser()async*{
    await for ( final pos in Geolocator.getPositionStream()){
      yield (pos.latitude,pos.longitude);
    }
  }
  MapControllerNotifier(): super(MapState()){
    trackUser().listen((event) { 
      lastLocation = (event.$1,event.$2);
    });
  }

  void setMapController( GoogleMapController controller){
    state = MapState(controller: controller, isReady: true);
  }

  void goToLocation( double latitude, double longitude){
    final newPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15);
    state.controller?.animateCamera( CameraUpdate.newCameraPosition(newPosition));

  }

  toggleFollowUser(){
    state = state.copyWith(followUser: !state.followUser);
    if( state.followUser){
      findUser();
      subscription = trackUser().listen((event) {
        goToLocation(event.$1, event.$2);
      });
    }else{
      subscription?.cancel();
    }
  }

  findUser(){
    if(lastLocation == null) return;

  final (latitude, longitude) = lastLocation!;
  goToLocation(latitude, longitude);
    // trackUser().take(1).listen((event) {
    //     goToLocation(event.$1, event.$2);
    // });
  }

  void addMarkerCurrentePosition(String name){
    if(lastLocation == null) return;
    final ( latitude, longitude) = lastLocation!;
    addMarker(latitude, longitude, name);

  }

  addMarker( double lactitude, double longitude, String name) {
    final newMarker = Marker(
      markerId: MarkerId('$lactitude$longitude'),
      position: LatLng(lactitude,longitude),
      infoWindow: InfoWindow(
        title: name,
        snippet: 'Esto es el snippet del info windows'
      )
      );

      state = state.copyWith(markers: [...state.markers, newMarker]);
  }

}
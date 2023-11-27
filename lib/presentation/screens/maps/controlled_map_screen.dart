import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/location/map_controller.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/location/user_location.dart';
// import 'package:riverpod_recursos_nativos/presentation/providers/location/watching_user_location.dart';
import 'package:riverpod_recursos_nativos/presentation/screens/widgets/map_view.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInitialLocation = ref.watch(userLocationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controllerd Map Screen'),
      ),body:
        userInitialLocation.when(
            data: (data){
              return MapandControlls(latitude: data.$1, longitude: data.$2);
            },
              error: (error, stackTrace) {
              return Text(error.toString());
            }, 
            loading: ()=> const CircularProgressIndicator())
    );
  }
}

class MapandControlls extends ConsumerWidget {
  const MapandControlls({super.key, required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final mapControllerState = ref.watch(mapControllerProvider);
    return Stack(
      children: [
        MapView(initialLatitud: latitude,
        initialLongitud: longitude),
        Positioned(
          top: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: (){
              context.pop();
            },
            icon:const Icon(Icons.arrow_back_ios_new_rounded),
          )),
        Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: (){
            ref.read(mapControllerProvider.notifier).findUser();

            // ref.read(mapControllerProvider.notifier).goToLocation(latitude, longitude);
            },
            icon:const Icon(Icons.location_searching_outlined),
          )),
        Positioned(
          bottom: 90,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: (){
              ref.read(mapControllerProvider.notifier).toggleFollowUser();
            },
            icon: Icon(
              mapControllerState.followUser ?
              Icons.directions_run:
              Icons.accessibility_new_outlined
              ),
          )),
          Positioned( // crear marcador 
          bottom: 140,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: (){
              ref.read(mapControllerProvider.notifier)
              .addMarker(latitude, longitude, 'por aqui pasó');
            },
            icon:const Icon(Icons.pin_drop),
          ))
      ],
    );
  }
}
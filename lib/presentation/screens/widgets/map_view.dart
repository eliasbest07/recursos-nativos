import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/location/map_controller.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key, 
    required this.initialLatitud, required this.initialLongitud});
  final double initialLatitud;
  final double initialLongitud;
  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends ConsumerState<MapView> {

  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);
    return GoogleMap(
      markers: mapController.markerSet,
      myLocationEnabled: false,
      myLocationButtonEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLatitud, widget.initialLongitud),
          zoom: 12
        ),
        onMapCreated: (GoogleMapController controller) {
         // _controller.complete(controller);
          ref.read(mapControllerProvider.notifier).setMapController(controller);
        },
      onLongPress: (argument) {
          ref.read(mapControllerProvider.notifier).addMarker(argument.latitude, argument.longitude, 'pos');
        
      },
      );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/location/user_location.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPositionAsync = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: currentPositionAsync.when(data: (data) {
        return _MapView(initialLatitud: data.$1, initialLongitud: data.$2,);
      }, 
      error: (error, stackTrace) {
        return Text(error.toString());
      }, 
      loading: ()=> const CircularProgressIndicator())
    );
  }
}

class _MapView extends StatefulWidget {
  const _MapView({ required this.initialLatitud, required this.initialLongitud});
  final double initialLatitud;
  final double initialLongitud;
  @override
  State<_MapView> createState() => _MapViewState();
}

class _MapViewState extends State<_MapView> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLatitud, widget.initialLongitud),
          zoom: 12
        ),
        onMapCreated: (GoogleMapController controller) {
         // _controller.complete(controller);
        },
      );
  }
}
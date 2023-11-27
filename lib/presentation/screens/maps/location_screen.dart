import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/location/user_location.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/location/watching_user_location.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationAsync = ref.watch(userLocationProvider);
    final watchingUserLocation = ref.watch(watchingUserLocationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text('Ubicacion actual'),
            userLocationAsync.when(data: (data) {
              return Text('$data');
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            }, 
            loading: ()=> const CircularProgressIndicator()),
            const SizedBox(height: 30),
            const Text('seguimiento'),
            watchingUserLocation.when(data: (data) {
              return Text('$data');
            }, 
            error: (error, stackTrace) {
              return Text(error.toString());
            }, 
            loading: ()=> const CircularProgressIndicator())
          ],
        ) ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/sensors/acelerometro_provider.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorGravityAccelerometer$ = ref.watch(accelerometerGavritiProvider);
    final sensorAccelerometer$ = ref.watch(accelerometerProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerometro'),
      ),
      body: Column(children: [
        Text('Acelerometro'),
       sensorGravityAccelerometer$.when(
            data: (data) {
              data.toString();
              return Text(data.toString());
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () => const CircularProgressIndicator()),
            
            sensorAccelerometer$.when(
            data: (data) {
              data.toString();
              return Text(data.toString());
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () => const CircularProgressIndicator()),
        ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/sensors/magnetrometer_provider.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnetometer$ = ref.watch(magnetrometerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brujual'),
      ),
      body: Column(children: [
        const Text('Brujual'),
        magnetometer$.when(
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

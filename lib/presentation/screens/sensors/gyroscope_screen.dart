import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/sensors/gyroscope_provider.dart';

class GyroscopeScreen extends ConsumerWidget {
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brujual'),
      ),
      body: Column(children: [
        const Text('Brujual'),
        gyroscope$.when(
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

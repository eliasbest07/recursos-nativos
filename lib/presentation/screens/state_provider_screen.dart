import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final String name = ref.watch(randomNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider Riverpod'),
      ),
      body: Center(
        child: Text(
          name,
          style: titleStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(randomNameProvider); // vuelve a ejecutar la creacion del provider
          // ref.read(randomNameProvider.notifier).update((state) => 'cambia') ;
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

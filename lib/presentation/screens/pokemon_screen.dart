import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdProvider);
    final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));
    final pokemonApi = ref.watch(
        pokemonNameDepProvider); // no trabaja igual que el de arriba, es diferente porque no guarda los valores de la peticion, la peticion se vuelve hacer
   
    final bool ispokemonApi = pokemonApi.isLoading;
    return Scaffold(
      appBar: AppBar(title: Text('Pokemon: $pokemonId')),
      body: pokemonAsync.when(
        data: (data) {
          return Text(data);
        },
        error: (error, _) {
          return Text('Error: $error');
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
            },
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state - 1);
            },
            child: const Icon(Icons.exposure_minus_1),
          )
        ],
      ),
    );
  }
}

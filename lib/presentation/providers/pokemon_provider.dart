import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/config/config.dart';

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

final pokemonNameProvider = FutureProvider.family<String, int>((ref, id) async {
  final name = PokemonService.getPokemonName(id);

  return name;
});

// que dependa del cambio de un state

final pokemonNameDepProvider = FutureProvider<String>((ref) async {
  final pokemonID = ref.watch(pokemonIdProvider); // si cambia se vuelve a realizar esta funcion
  final name = PokemonService.getPokemonName(pokemonID);

  return name;
});

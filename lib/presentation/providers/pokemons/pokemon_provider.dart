import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/domain/entities/pokemon.dart';
import 'package:riverpod_recursos_nativos/domain/repositories/pokemon_repository.dart';
import 'package:riverpod_recursos_nativos/infrastructure/repositories/pokemons_repository_impl.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  return PokemonRepositoryImpl();
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  final (pokemon, error) = await pokemonRepository.getPokemon(id);

  if (pokemon != null) {
    return pokemon;
  }
  throw error;
});

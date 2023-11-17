import 'package:riverpod_recursos_nativos/domain/entities/pokemon.dart';

abstract class PokemonDatasource {
  Future<(Pokemon?, String)> getPokemon(String id);
}

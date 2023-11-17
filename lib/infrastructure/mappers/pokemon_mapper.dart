import 'package:riverpod_recursos_nativos/domain/entities/pokemon.dart';
import 'package:riverpod_recursos_nativos/infrastructure/models/pokemon_model.dart';

class PokemonMapper {
  static Pokemon pokeApiToEntity(Map<String, dynamic> json) {
    final PokemonModel pokeApiResponse = PokemonModel.fromJson(json);
    return Pokemon(
        id: pokeApiResponse.id,
        name: pokeApiResponse.name,
        sprinteFront: pokeApiResponse.sprites.frontDefault);
  }
}

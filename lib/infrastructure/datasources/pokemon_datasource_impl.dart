import 'package:dio/dio.dart';
import 'package:riverpod_recursos_nativos/domain/datasources/pokemon_datascource.dart';
import 'package:riverpod_recursos_nativos/domain/entities/pokemon.dart';
import 'package:riverpod_recursos_nativos/infrastructure/mappers/pokemon_mapper.dart';

class PokemonDatasourceImplementation implements PokemonDatasource {
  final Dio dio;

  PokemonDatasourceImplementation()
      : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));
  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final resp = await dio.get('/pokemon/$id');
      resp.data;
      final  Pokemon  pokemon = PokemonMapper.pokeApiToEntity(resp.data);
  
      return (pokemon, 'success');
    } catch (e) {
      return (null, 'no se pudo obtner error $e');
    }
  }
}

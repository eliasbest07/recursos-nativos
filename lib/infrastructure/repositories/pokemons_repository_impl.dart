import 'package:riverpod_recursos_nativos/domain/datasources/pokemon_datascource.dart';
import 'package:riverpod_recursos_nativos/domain/entities/pokemon.dart';
import 'package:riverpod_recursos_nativos/domain/repositories/pokemon_repository.dart';
import 'package:riverpod_recursos_nativos/infrastructure/datasources/pokemon_datasource_impl.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl({PokemonDatasource? datasource})
      : datasource = datasource ?? PokemonDatasourceImplementation();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) {
    return datasource.getPokemon(id);
   
  }
}

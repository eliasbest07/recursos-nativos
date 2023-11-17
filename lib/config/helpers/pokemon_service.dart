import 'package:dio/dio.dart';

class PokemonService {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/1');
      return response.data['name'] ?? ' Name not found';
    } catch (e) {
      throw Exception( 'Dio error Api pokemon');
    }
  }
}

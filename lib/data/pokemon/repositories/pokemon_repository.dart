import 'package:pokemon/data/pokemon/entities/pokemon_list.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/shared/exceptions/app_error_exception.dart';

abstract class PokemonRepository {
  Future<PokemonList?> getPokemons();
}

class PokemonRepositoryImpl implements PokemonRepository {
  var dio = Dio();

  @override
  Future<PokemonList?> getPokemons() async {
    try {
      final response = await dio
          .get('https://pokeapi.co/api/v2/pokemon/?limit=15&offset=10');

      if (response.statusCode == 200) {
        final pokemonList = PokemonList.fromJson(response.data);
        return pokemonList;
      }
    } catch (error) {
      throw AppErrorException();
    }
    return null;
  }
}

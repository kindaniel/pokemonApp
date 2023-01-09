import 'package:pokemon/data/pokemon/mappers/pokemon_mapper.dart';
import 'package:pokemon/domain/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/domain/entities/pokemon_list.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/shared/exceptions/app_error_exception.dart';

abstract class PokemonRemoteRepository {
  Future<PokemonList?> getPokemons();
  Future<PokemonDetails?> getPokemonDetails({required String pokemonId});
  Future<PokemonAbilities?> getPokemonAbilities({required String pokemonId});
}

class PokemonRepositoryImpl implements PokemonRemoteRepository {
  var dio = Dio();

  @override
  Future<PokemonList?> getPokemons() async {
    try {
      final response = await dio
          .get('https://pokeapi.co/api/v2/pokemon/?limit=200&offset=10');

      if (response.statusCode == 200) {
        final pokemonList = PokemonMapper.pokemonListFromJson(response.data);
        return pokemonList;
      }
    } catch (error) {
      throw AppErrorException();
    }
    return null;
  }

  @override
  Future<PokemonDetails?> getPokemonDetails({required String pokemonId}) async {
    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId/');

      if (response.statusCode == 200) {
        final pokemonDetails = PokemonDetails.fromJson(response.data);
        return pokemonDetails;
      }
    } catch (error) {
      throw AppErrorException();
    }
    return null;
  }

  @override
  Future<PokemonAbilities?> getPokemonAbilities(
      {required String pokemonId}) async {
    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/ability/$pokemonId/');

      if (response.statusCode == 200) {
        final pokemonAbilities = PokemonAbilities.fromJson(response.data);
        return pokemonAbilities;
      }
    } catch (error) {
      throw AppErrorException();
    }
    return null;
  }
}

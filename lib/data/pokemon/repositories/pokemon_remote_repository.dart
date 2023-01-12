import 'package:pokemon/data/pokemon/mappers/pokemon_mapper.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/settings/app_constants.dart';
import 'package:pokemon/shared/exceptions/app_error_exception.dart';

abstract class PokemonRemoteRepository {
  Future<PokemonList?> getPokemons({PokemonList? currentPokemonList});
  Future<PokemonDetails?> getPokemonDetails({required String pokemonId});
  Future<PokemonAbilities?> getPokemonAbilities({required String pokemonId});
}

class PokemonRepositoryImpl implements PokemonRemoteRepository {
  var dio = Dio();

  @override
  Future<PokemonList?> getPokemons({PokemonList? currentPokemonList}) async {
    try {
      var url = '${AppConstants.apiUrl}/pokemon/?limit=15&offset=10';
      if (currentPokemonList != null) {
        url = currentPokemonList.next;
      }
      final response = await dio.get(url);

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
          await dio.get('${AppConstants.apiUrl}/pokemon/$pokemonId/');

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
          await dio.get('${AppConstants.apiUrl}/ability/$pokemonId/');

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

import 'package:dio/dio.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/domain/pokemon/repositories/pokemon_repository.dart';
import 'package:pokemon/external/datasources/pokemon_remote_datasource.dart';
import 'package:pokemon/shared/exceptions/app_error_exception.dart';

class PokemonRepositoryImpl implements PokemonRemoteRepository {
  var dio = Dio();

  final PokemonRemoteDataSource pokemonRemoteDataSource;

  PokemonRepositoryImpl({required this.pokemonRemoteDataSource});

  @override
  Future<PokemonList?> getPokemons({PokemonList? currentPokemonList}) async {
    try {
      return pokemonRemoteDataSource.getPokemons(
          currentPokemonList: currentPokemonList);
    } catch (error) {
      if (error is DioError) {
        throw AppErrorException(
            code: error.response!.statusCode!,
            message: error.response!.statusMessage!);
      } else {
        throw AppErrorException();
      }
    }
  }

  @override
  Future<PokemonDetails?> getPokemonDetails({required String pokemonId}) async {
    try {
      return pokemonRemoteDataSource.getPokemonDetails(pokemonId: pokemonId);
    } catch (error) {
      if (error is DioError) {
        throw AppErrorException(
            code: error.response!.statusCode!,
            message: error.response!.statusMessage!);
      } else {
        throw AppErrorException();
      }
    }
  }

  @override
  Future<PokemonAbilities?> getPokemonAbilities(
      {required String pokemonId}) async {
    try {
      return pokemonRemoteDataSource.getPokemonAbilities(pokemonId: pokemonId);
    } catch (error) {
      if (error is DioError) {
        throw AppErrorException(
            code: error.response!.statusCode!,
            message: error.response!.statusMessage!);
      } else {
        throw AppErrorException();
      }
    }
  }
}

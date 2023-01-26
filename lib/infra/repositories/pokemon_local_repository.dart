import 'package:hive/hive.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/domain/pokemon/repositories/pokemon_repository.dart';
import 'package:pokemon/external/datasources/pokemon_local_datasource.dart';
import 'package:pokemon/settings/app_constants.dart';
import 'package:pokemon/shared/exceptions/app_error_exception.dart';

class PokemonLocalRepositoryImpl implements PokemonLocalRepository {
  final PokemonLocalDataSource pokemonLocalDataSource;
  PokemonLocalRepositoryImpl({required this.pokemonLocalDataSource});

  var box = Hive.box(AppConstants.ratingHiveBoxName);
  @override
  Future<PokemonRating> getRating({required String pokemonId}) async {
    try {
      return pokemonLocalDataSource.getRating(pokemonId: pokemonId);
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  void saveRating({required PokemonRating pokemonRating}) async {
    try {
      pokemonLocalDataSource.saveRating(pokemonRating: pokemonRating);
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  void saveComment({required String pokemonId, required String comment}) async {
    try {
      pokemonLocalDataSource.saveComment(
          pokemonId: pokemonId, comment: comment);
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  Future<PokemonComments> getComments({required String pokemonId}) async {
    try {
      return pokemonLocalDataSource.getComments(pokemonId: pokemonId);
    } catch (error) {
      throw AppErrorException();
    }
  }
}

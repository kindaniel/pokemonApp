import 'package:hive/hive.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/settings/app_constants.dart';
import 'package:pokemon/shared/exceptions/app_error_exception.dart';

// ignore: constant_identifier_names
const COMMENT_IDENTIFIER = 'comments';

abstract class PokemonLocalRepository {
  void saveRating({required PokemonRating pokemonRating});
  Future<PokemonRating> getRating({required String pokemonId});
  Future<PokemonComments> getComments({required String pokemonId});
  void saveComment({required String pokemonId, required String comment});
}

class PokemonLocalRepositoryImpl implements PokemonLocalRepository {
  var box = Hive.box(AppConstants.ratingHiveBoxName);
  @override
  Future<PokemonRating> getRating({required String pokemonId}) async {
    try {
      final rating = await box.get(pokemonId);

      if (rating == null) {
        return PokemonRating(id: '', rating: 0);
      }
      return PokemonRating(id: pokemonId, rating: rating['rating']);
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  void saveRating({required PokemonRating pokemonRating}) async {
    try {
      await box.put(
        pokemonRating.id,
        {
          'rating': pokemonRating.rating,
        },
      );
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  void saveComment({required String pokemonId, required String comment}) async {
    try {
      final existentComments = await getComments(pokemonId: pokemonId);

      await box.put(
        pokemonId + COMMENT_IDENTIFIER,
        {
          'comments': [...existentComments.comments, comment],
        },
      );
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  Future<PokemonComments> getComments({required String pokemonId}) async {
    try {
      final comments = await box.get(
        pokemonId + COMMENT_IDENTIFIER,
      );

      if (comments == null) {
        return PokemonComments(id: pokemonId, comments: []);
      }
      return PokemonComments(id: pokemonId, comments: comments['comments']);
    } catch (error) {
      throw AppErrorException();
    }
  }
}

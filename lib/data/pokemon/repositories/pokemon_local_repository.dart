import 'package:hive/hive.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/settings/app_constants.dart';

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
    final rating = await box.get(pokemonId);

    if (rating == null) {
      return PokemonRating(id: '', rating: 0);
    }
    return PokemonRating(id: pokemonId, rating: rating['rating']);
  }

  @override
  void saveRating({required PokemonRating pokemonRating}) async {
    await box.put(
      pokemonRating.id,
      {
        'rating': pokemonRating.rating,
      },
    );
  }

  @override
  void saveComment({required String pokemonId, required String comment}) async {
    final existentComments = await getComments(pokemonId: pokemonId);

    await box.put(
      pokemonId + COMMENT_IDENTIFIER,
      {
        'comments': [...existentComments.comments, comment],
      },
    );
  }

  @override
  Future<PokemonComments> getComments({required String pokemonId}) async {
    final comments = await box.get(
      pokemonId + COMMENT_IDENTIFIER,
    );

    if (comments == null) {
      return PokemonComments(id: pokemonId, comments: []);
    }
    return PokemonComments(id: pokemonId, comments: comments['comments']);
  }
}

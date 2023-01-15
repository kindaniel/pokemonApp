import 'package:hive/hive.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/settings/app_constants.dart';

// ignore: constant_identifier_names
const COMMENT_IDENTIFIER = 'comments';

abstract class PokemonLocalRepository {
  void saveRating({required PokemonRating pokemonRating});
  Future<PokemonRating> getRating({required String pokemonId});
  void saveComment({required String pokemonId, required String comment});
}

class PokemonLocalRepositoryImpl implements PokemonLocalRepository {
  @override
  Future<PokemonRating> getRating({required String pokemonId}) async {
    var box = Hive.box(AppConstants.ratingHiveBoxName);

    final rating = await box.get(pokemonId);

    if (rating == null) {
      return PokemonRating(id: '', rating: 0);
    }
    return PokemonRating(id: pokemonId, rating: rating['rating']);
  }

  @override
  void saveRating({required PokemonRating pokemonRating}) async {
    var box = Hive.box(AppConstants.ratingHiveBoxName);

    await box.put(
      pokemonRating.id,
      {
        'rating': pokemonRating.rating,
      },
    );
  }

  @override
  void saveComment({required String pokemonId, required String comment}) async {
    var box = Hive.box(AppConstants.ratingHiveBoxName);

    await box.put(
      pokemonId + COMMENT_IDENTIFIER,
      {
        'comments': comment,
      },
    );
  }
}

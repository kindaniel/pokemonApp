import 'package:hive/hive.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/settings/app_constants.dart';

abstract class PokemonLocalRepository {
  void save({required PokemonRating pokemonRating});
  Future<PokemonRating> get({required String pokemonId});
}

class PokemonLocalRepositoryImpl implements PokemonLocalRepository {
  @override
  Future<PokemonRating> get({required String pokemonId}) async {
    var box = Hive.box(AppConstants.ratingHiveBoxName);

    final rating = await box.get(pokemonId);

    if (rating == null) {
      return PokemonRating(id: '', rating: 0, comment: '');
    }
    return PokemonRating(
        id: pokemonId, rating: rating['rating'], comment: rating['comment']);
  }

  @override
  void save({required PokemonRating pokemonRating}) async {
    var box = Hive.box(AppConstants.ratingHiveBoxName);

    await box.put(pokemonRating.id,
        {'rating': pokemonRating.rating, 'comment': pokemonRating.comment});
  }
}

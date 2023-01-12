import 'package:pokemon/data/pokemon/repositories/pokemon_local_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';

abstract class SavePokemonRatingUseCase {
  void call({
    required String pokemonId,
    required double pokemonRating,
    required String comment,
  });
}

class SavePokemonRatingUseCaseImpl implements SavePokemonRatingUseCase {
  final PokemonLocalRepository pokemonLocalRepository;

  SavePokemonRatingUseCaseImpl({required this.pokemonLocalRepository});
  @override
  Future<void> call(
      {required String pokemonId,
      required double pokemonRating,
      required String comment}) async {
    pokemonLocalRepository.save(
        pokemonRating: PokemonRating(
      comment: comment,
      id: pokemonId,
      rating: pokemonRating,
    ));
  }
}

import 'package:pokemon/data/pokemon/repositories/pokemon_local_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';

abstract class GetPokemonRatingUseCase {
  Future<PokemonRating> call({required String pokemonId});
}

class GetPokemonRatingUseCaseImpl implements GetPokemonRatingUseCase {
  final PokemonLocalRepository pokemonLocalRepository;

  GetPokemonRatingUseCaseImpl({required this.pokemonLocalRepository});
  @override
  Future<PokemonRating> call({required String pokemonId}) async {
    return await pokemonLocalRepository.get(pokemonId: pokemonId);
  }
}

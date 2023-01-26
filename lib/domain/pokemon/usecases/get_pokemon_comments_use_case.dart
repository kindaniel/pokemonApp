import 'package:pokemon/domain/pokemon/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';

abstract class GetPokemonCommentsUseCase {
  Future<PokemonComments> call({
    required String pokemonId,
  });
}

class GetPokemonCommentsUseCaseImpl implements GetPokemonCommentsUseCase {
  final PokemonLocalRepository pokemonLocalRepository;

  GetPokemonCommentsUseCaseImpl({required this.pokemonLocalRepository});
  @override
  Future<PokemonComments> call({
    required String pokemonId,
  }) async {
    return pokemonLocalRepository.getComments(pokemonId: pokemonId);
  }
}

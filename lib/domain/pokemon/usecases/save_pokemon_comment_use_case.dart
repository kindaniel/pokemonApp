import 'package:pokemon/data/pokemon/repositories/pokemon_local_repository.dart';

abstract class SavePokemonCommentsUseCase {
  void call({
    required String pokemonId,
    required String comment,
  });
}

class SavePokemonCommentUseCaseImpl implements SavePokemonCommentsUseCase {
  final PokemonLocalRepository pokemonLocalRepository;

  SavePokemonCommentUseCaseImpl({required this.pokemonLocalRepository});
  @override
  Future<void> call({
    required String pokemonId,
    required String comment,
  }) async {
    pokemonLocalRepository.saveComment(pokemonId: pokemonId, comment: comment);
  }
}

import 'package:pokemon/data/pokemon/entities/pokemon_rating.dart';

abstract class PokemonRemoteRepository {
  Future<void> savePokemonRating({required PokemonRating pokemonRating});
  Future<void> readPokemonRating({required PokemonRating pokemonRating});
}

class PokemonLocalRepository implements PokemonRemoteRepository {
  @override
  Future<void> readPokemonRating({required PokemonRating pokemonRating}) {
    throw UnimplementedError();
  }

  @override
  Future<void> savePokemonRating({required PokemonRating pokemonRating}) {
    throw UnimplementedError();
  }
}

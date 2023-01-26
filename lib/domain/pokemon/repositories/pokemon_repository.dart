import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';

abstract class PokemonLocalRepository {
  void saveRating({required PokemonRating pokemonRating});
  Future<PokemonRating> getRating({required String pokemonId});
  Future<PokemonComments> getComments({required String pokemonId});
  void saveComment({required String pokemonId, required String comment});
}

abstract class PokemonRemoteRepository {
  Future<PokemonList?> getPokemons({PokemonList? currentPokemonList});
  Future<PokemonDetails?> getPokemonDetails({required String pokemonId});
  Future<PokemonAbilities?> getPokemonAbilities({required String pokemonId});
}

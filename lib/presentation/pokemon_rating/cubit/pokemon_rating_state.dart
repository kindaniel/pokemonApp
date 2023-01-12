part of 'pokemon_rating_cubit.dart';

abstract class PokemonRatingState {}

class PokemonRatingInitial extends PokemonRatingState {}

class PokemonRatingLoading extends PokemonRatingState {}

class PokemonRatingSuccess extends PokemonRatingState {
  final PokemonRating pokemonRating;

  PokemonRatingSuccess({required this.pokemonRating});
}

class PokemonRatingError extends PokemonRatingState {}

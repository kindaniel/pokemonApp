part of 'pokemon_detail_cubit.dart';

abstract class PokemonDetailsState {}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsLoading extends PokemonDetailsState {}

class PokemonDetailsSuccess extends PokemonDetailsState {
  final PokemonDetails pokemonDetails;

  PokemonDetailsSuccess({required this.pokemonDetails});
}

class PokemonDetailsError extends PokemonDetailsState {}

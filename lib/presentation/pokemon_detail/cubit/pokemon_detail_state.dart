part of 'pokemon_detail_cubit.dart';

abstract class PokemonDetailState {}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailSuccess extends PokemonDetailState {
  final PokemonDetails pokemonDetails;

  PokemonDetailSuccess({required this.pokemonDetails});
}

class PokemonDetailError extends PokemonDetailState {}

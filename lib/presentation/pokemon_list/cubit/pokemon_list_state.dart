part of 'pokemon_list_cubit.dart';

abstract class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListSuccess extends PokemonListState {
  final PokemonList pokemonList;

  PokemonListSuccess({required this.pokemonList});
}

class PokemonListError extends PokemonListState {}

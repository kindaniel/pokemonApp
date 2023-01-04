part of 'pokemon_abilities_cubit.dart';

abstract class PokemonAbilitiesState {}

class PokemonAbilitiesInitial extends PokemonAbilitiesState {}

class PokemonAbilitiesLoading extends PokemonAbilitiesState {}

class PokemonAbilitiesSuccess extends PokemonAbilitiesState {
  final PokemonAbilities pokemonAbilities;

  PokemonAbilitiesSuccess({required this.pokemonAbilities});
}

class PokemonAbilitiesError extends PokemonAbilitiesState {}

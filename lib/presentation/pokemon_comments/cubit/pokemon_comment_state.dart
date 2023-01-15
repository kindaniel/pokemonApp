part of 'pokemon_comment_cubit.dart';

abstract class PokemonCommentState {}

class PokemonCommentInitial extends PokemonCommentState {}

class PokemonCommentLoading extends PokemonCommentState {}

class PokemonCommentSuccess extends PokemonCommentState {
  final PokemonComments pokemonComments;

  PokemonCommentSuccess({required this.pokemonComments});
}

class PokemonCommentsEmpty extends PokemonCommentState {}

class PokemonCommentError extends PokemonCommentState {}

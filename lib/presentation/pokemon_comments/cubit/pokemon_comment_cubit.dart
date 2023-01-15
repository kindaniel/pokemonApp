import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_comments_use_case.dart';
import 'package:pokemon/domain/pokemon/usecases/save_pokemon_comment_use_case.dart';

part 'pokemon_comment_state.dart';

class PokemonCommentCubit extends Cubit<PokemonCommentState> {
  final SavePokemonCommentsUseCase savePokemonCommentsUseCase;
  final GetPokemonCommentsUseCase getPokemonCommentsUseCase;
  PokemonCommentCubit(
      {required this.savePokemonCommentsUseCase,
      required this.getPokemonCommentsUseCase})
      : super(PokemonCommentInitial());

  void saveComment({required String pokemonId, required String comment}) async {
    savePokemonCommentsUseCase(
      pokemonId: pokemonId,
      comment: comment,
    );
  }

  void getComments({required String pokemonId}) async {
    emit(PokemonCommentLoading());
    final pokemonComments =
        await getPokemonCommentsUseCase(pokemonId: pokemonId);
    if (pokemonComments.comments.isEmpty) {
      emit(PokemonCommentsEmpty());
      return;
    }
    emit(PokemonCommentSuccess(pokemonComments: pokemonComments));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/domain/pokemon/usecases/save_pokemon_comment_use_case.dart';

part 'pokemon_comment_state.dart';

class PokemonCommentCubit extends Cubit<PokemonCommentState> {
  final SavePokemonCommentsUseCase savePokemonCommentsUseCase;
  PokemonCommentCubit({required this.savePokemonCommentsUseCase})
      : super(PokemonCommentInitial());

  void saveComment({required String pokemonId, required String comment}) async {
    emit(PokemonCommentLoading());
    savePokemonCommentsUseCase(
      pokemonId: pokemonId,
      comment: comment,
    );
  }
}

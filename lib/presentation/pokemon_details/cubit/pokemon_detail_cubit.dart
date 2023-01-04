import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/data/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_detail_use_case.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailState> {
  PokemonDetailsCubit({required this.getPokemonDetailUseCase})
      : super(PokemonDetailInitial());

  final GetPokemonDetailsUseCase getPokemonDetailUseCase;

  void getPokemonDetails({required String pokemonId}) async {
    emit(PokemonDetailLoading());
    await Future.delayed(const Duration(seconds: 1));
    final pokemonDetails = await getPokemonDetailUseCase(pokemonId: pokemonId);
    if (pokemonDetails != null) {
      emit(PokemonDetailSuccess(pokemonDetails: pokemonDetails));
    } else {
      emit(PokemonDetailError());
    }
  }
}

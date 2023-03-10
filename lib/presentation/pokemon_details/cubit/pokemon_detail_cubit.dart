import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_detail_use_case.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit({required this.getPokemonDetailsUseCase})
      : super(PokemonDetailsInitial());

  final GetPokemonDetailsUseCase getPokemonDetailsUseCase;

  void getPokemonDetails({required String pokemonId}) async {
    emit(PokemonDetailsLoading());
    final pokemonDetails = await getPokemonDetailsUseCase(pokemonId: pokemonId);
    if (pokemonDetails != null && pokemonDetails.abilities.isNotEmpty) {
      emit(PokemonDetailsSuccess(pokemonDetails: pokemonDetails));
    } else {
      emit(PokemonDetailsError());
    }
  }
}

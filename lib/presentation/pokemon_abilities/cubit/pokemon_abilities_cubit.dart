import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_abilities_use_case.dart';

part 'pokemon_abilities_state.dart';

class PokemonAbilitiesCubit extends Cubit<PokemonAbilitiesState> {
  PokemonAbilitiesCubit({required this.getPokemonAbilitiesUseCase})
      : super(PokemonAbilitiesInitial());

  final GetPokemonAbilitiesUseCase getPokemonAbilitiesUseCase;

  void getPokemonAbilities({required String pokemonId}) async {
    emit(PokemonAbilitiesLoading());

    final pokemonAbilities =
        await getPokemonAbilitiesUseCase(pokemonId: pokemonId);
    if (pokemonAbilities != null && pokemonAbilities.effectEntries.isNotEmpty) {
      emit(PokemonAbilitiesSuccess(pokemonAbilities: pokemonAbilities));
    } else {
      emit(PokemonAbilitiesError());
    }
  }
}

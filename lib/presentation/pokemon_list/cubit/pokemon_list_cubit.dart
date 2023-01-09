import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemons_use_case.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit({required this.getPokemonsUseCase})
      : super(PokemonListInitial());

  final GetPokemonsUseCase getPokemonsUseCase;

  void getPokemons({PokemonList? currentPokemonList}) async {
    final result =
        await getPokemonsUseCase(currentPokemonList: currentPokemonList);

    if (result != null && result.pokemons.isNotEmpty) {
      emit(PokemonListSuccess(pokemonList: result));
    } else {
      emit(PokemonListError());
    }
  }
}

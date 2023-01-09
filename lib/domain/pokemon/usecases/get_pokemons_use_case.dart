import 'package:pokemon/data/pokemon/repositories/pokemon_remote_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';

abstract class GetPokemonsUseCase {
  Future<PokemonList?> call({PokemonList? currentPokemonList});
}

class GetPokemonsUseCaseImp implements GetPokemonsUseCase {
  GetPokemonsUseCaseImp({required this.pokemonRepository});

  final PokemonRemoteRepository pokemonRepository;

  @override
  Future<PokemonList?> call({PokemonList? currentPokemonList}) async {
    List<Pokemon> pokemonList = [];
    final result = await pokemonRepository.getPokemons(
        currentPokemonList: currentPokemonList);

    if (currentPokemonList != null) {
      pokemonList.addAll(currentPokemonList.pokemons);
    }

    if (result != null && result.pokemons.isNotEmpty) {
      pokemonList.addAll(result.pokemons);
    }

    return PokemonList(
      count: result!.count,
      next: result.next,
      previous: result.previous,
      pokemons: pokemonList,
    );
  }
}

import 'package:pokemon/data/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/data/pokemon/repositories/pokemon_repository.dart';

abstract class GetPokemonsUseCase {
  Future<PokemonList?> call();
}

class GetPokemonsUseCaseImp implements GetPokemonsUseCase {
  GetPokemonsUseCaseImp({required this.pokemonRepository});

  final PokemonRepository pokemonRepository;

  @override
  Future<PokemonList?> call() {
    return pokemonRepository.getPokemons();
  }
}

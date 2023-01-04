import 'package:pokemon/data/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/data/pokemon/repositories/pokemon_repository.dart';

abstract class GetPokemonDetailsUseCase {
  Future<PokemonDetails?> call({required String pokemonId});
}

class GetPokemonDetailsUseCaseImp implements GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCaseImp({required this.pokemonRepository});

  final PokemonRepository pokemonRepository;

  @override
  Future<PokemonDetails?> call({required String pokemonId}) {
    return pokemonRepository.getPokemonDetails(pokemonId: pokemonId);
  }
}

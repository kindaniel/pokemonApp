import 'package:pokemon/data/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/data/pokemon/repositories/pokemon_repository.dart';

abstract class GetPokemonDetailUseCase {
  Future<PokemonDetails?> call({required String pokemonId});
}

class GetPokemonDetailUseCaseImp implements GetPokemonDetailUseCase {
  GetPokemonDetailUseCaseImp({required this.pokemonRepository});

  final PokemonRepository pokemonRepository;

  @override
  Future<PokemonDetails?> call({required String pokemonId}) {
    return pokemonRepository.getPokemonDetails(pokemonId: pokemonId);
  }
}

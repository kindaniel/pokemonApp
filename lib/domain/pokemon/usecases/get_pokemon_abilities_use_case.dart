import 'package:pokemon/data/pokemon/repositories/pokemon_remote_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';

abstract class GetPokemonAbilitiesUseCase {
  Future<PokemonAbilities?> call({required String pokemonId});
}

class GetPokemonAbilitiesUseCaseImp implements GetPokemonAbilitiesUseCase {
  GetPokemonAbilitiesUseCaseImp({required this.pokemonRepository});

  final PokemonRemoteRepository pokemonRepository;

  @override
  Future<PokemonAbilities?> call({required String pokemonId}) {
    return pokemonRepository.getPokemonAbilities(pokemonId: pokemonId);
  }
}

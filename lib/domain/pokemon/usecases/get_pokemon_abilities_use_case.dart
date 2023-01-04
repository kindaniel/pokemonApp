import 'package:pokemon/data/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/data/pokemon/repositories/pokemon_repository.dart';

abstract class GetPokemonAbilities {
  Future<PokemonAbilities?> call({required String pokemonId});
}

class GetPokemonAbilitiesImp implements GetPokemonAbilities {
  GetPokemonAbilitiesImp({required this.pokemonRepository});

  final PokemonRepository pokemonRepository;

  @override
  Future<PokemonAbilities?> call({required String pokemonId}) {
    return pokemonRepository.getPokemonAbilities(pokemonId: pokemonId);
  }
}

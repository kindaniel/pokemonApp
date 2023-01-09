import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/data/pokemon/mappers/pokemon_mapper.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_details.dart';

import '../../mocks/mock_json_pokemon_abilities.dart';
import '../../mocks/mock_json_pokemon_details.dart';
import '../../mocks/mock_json_pokemon_list.dart';

void main() {
  group('pokemonMapper tests', () {
    final pokemonJsonFromApi = pokemonJsonData();

    test('should return pokemonList with correct entity', () async {
      final pokemonList = PokemonMapper.pokemonListFromJson(pokemonJsonFromApi);

      expect(pokemonList.count, 1154);
      expect(pokemonList.pokemons.length, 15);
      expect(pokemonList.pokemons[0].name, 'metapod');
      expect(pokemonList.pokemons[0].id, '11');
    });
  });

  group('pokemonAbilities tests', () {
    final pokemonAbilitiesFromApi = pokemonAbilitiesJson();

    test('should return pokemonAbilitiesFromApi and parse into entity',
        () async {
      final pokemonAbilities =
          PokemonAbilities.fromJson(pokemonAbilitiesFromApi);

      expect(pokemonAbilities.effectEntries.length, 1);
      expect(pokemonAbilities.effectEntries[0].effect,
          'This Pokémon is immune to damaging moves that are not super effective against it. Moves that inflict fixed damage, such as night shade or seismic toss, are considered super effective if their types are.  Damage not directly dealt by moves, such as damage from weather, a status ailment, or spikes, is not prevented. This ability cannot be copied with role play or traded away with skill swap, but it can be copied with trace, disabled with gastro acid, or changed with worry seed.  This Pokémon can still use Role Play itself to lose this ability, but not Skill Swap. If this Pokémon has a substitute, this ability will block moves as usual and any moves not blocked will react to the Substitute as usual.');
    });
  });

  group('pokemonDetails tests', () {
    //arrange
    final pokemonDetailsFromApi = pokemonDetailsData();

    test('should return pokemonDetailsFromApi and parse into entity', () async {
      //act
      final pokemonDetails = PokemonDetails.fromJson(pokemonDetailsFromApi);

      //assert
      expect(pokemonDetails.abilities.length, 2);
      expect(pokemonDetails.height, 4);
      expect(pokemonDetails.weight, 60);
    });
  });
}

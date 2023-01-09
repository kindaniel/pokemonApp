import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/data/pokemon/mappers/pokemon_mapper.dart';

import 'mock_json.dart';

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
}

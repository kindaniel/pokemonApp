import 'package:pokemon/domain/entities/pokemon_list.dart';

abstract class PokemonMapper {
  static PokemonList pokemonListFromJson(Map<String, dynamic> json) {
    return PokemonList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      pokemons:
          List.from(json['results']).map((e) => Pokemon.fromJson(e)).toList(),
    );
  }
}

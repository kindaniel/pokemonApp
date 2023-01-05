class PokemonList {
  PokemonList({
    required this.count,
    required this.next,
    required this.previous,
    required this.pokemons,
  });
  late final int count;
  late final String next;
  late final String previous;
  late final List<Pokemon> pokemons;

  PokemonList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    pokemons =
        List.from(json['results']).map((e) => Pokemon.fromJson(e)).toList();
  }
}

class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
  });
  late final String id;
  late final String name;
  late final String url;

  Pokemon.fromJson(Map<String, dynamic> json) {
    final String last3characters =
        json['url'].substring(json['url'].length - 3);

    final pokemonId = last3characters.replaceAll('/', '');

    name = json['name'];
    url = json['url'];
    id = pokemonId;
  }
}

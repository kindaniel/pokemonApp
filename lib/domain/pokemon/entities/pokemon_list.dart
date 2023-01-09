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
}

class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
    required this.id,
  });
  late final String id;
  late final String name;
  late final String url;
}

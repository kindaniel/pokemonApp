class PokemonDetails {
  PokemonDetails({
    required this.abilities,
    required this.id,
    required this.stats,
    required this.types,
    required this.weight,
    required this.height,
  });
  late final List<Abilities> abilities;
  late final int id;
  late final List<Stats> stats;
  late final List<Types> types;
  late final List<Moves> moves;

  late final int weight;
  late final int height;

  PokemonDetails.fromJson(Map<String, dynamic> json) {
    abilities =
        List.from(json['abilities']).map((e) => Abilities.fromJson(e)).toList();
    id = json['id'];
    stats = List.from(json['stats']).map((e) => Stats.fromJson(e)).toList();
    types = List.from(json['types']).map((e) => Types.fromJson(e)).toList();
    moves = List.from(json['moves']).map((e) => Moves.fromJson(e)).toList();
    height = json['height'];
    weight = json['weight'];
  }
}

class Abilities {
  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
  late final Ability ability;
  late final bool isHidden;
  late final int slot;

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = Ability.fromJson(json['ability']);
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }
}

class Ability {
  Ability({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Stats {
  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
  late final int baseStat;
  late final int effort;
  late final Stat stat;

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = Stat.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    data['stat'] = stat.toJson();
    return data;
  }
}

class Stat {
  Stat({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Types {
  Types({
    required this.slot,
    required this.type,
  });
  late final int slot;
  late final Type type;

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = Type.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['slot'] = slot;
    data['type'] = type.toJson();
    return data;
  }
}

class Type {
  Type({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Moves {
  Moves({
    required this.move,
  });
  late final Move move;

  Moves.fromJson(Map<String, dynamic> json) {
    move = Move.fromJson(json['move']);
  }
}

class Move {
  Move({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class PokemonAbilities {
  PokemonAbilities({
    required this.effectEntries,
  });
  late final List<EffectEntries> effectEntries;

  PokemonAbilities.fromJson(Map<String, dynamic> json) {
    effectEntries = List.from(json['effect_entries'])
        .map((e) => EffectEntries.fromJson(e))
        .toList();
  }
}

class EffectEntries {
  EffectEntries({
    required this.effect,
    required this.language,
  });
  late final String effect;
  late final Language language;

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = Language.fromJson(json['language']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['effect'] = effect;
    data['language'] = language.toJson();
    return data;
  }
}

class Language {
  Language({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Language.fromJson(Map<String, dynamic> json) {
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

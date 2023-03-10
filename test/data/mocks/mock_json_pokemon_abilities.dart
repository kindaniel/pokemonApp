import 'dart:convert';

pokemonAbilitiesJson() {
  const String data = '''
{
	"effect_entries": [
		{
			"effect": "This Pokémon is immune to damaging moves that are not super effective against it. Moves that inflict fixed damage, such as night shade or seismic toss, are considered super effective if their types are.  Damage not directly dealt by moves, such as damage from weather, a status ailment, or spikes, is not prevented. This ability cannot be copied with role play or traded away with skill swap, but it can be copied with trace, disabled with gastro acid, or changed with worry seed.  This Pokémon can still use Role Play itself to lose this ability, but not Skill Swap. If this Pokémon has a substitute, this ability will block moves as usual and any moves not blocked will react to the Substitute as usual.",
			"language": {
				"name": "en",
				"url": "https://pokeapi.co/api/v2/language/9/"
			},
			"short_effect": "Protects against damaging moves that are not super effective."
		}
	]
}
''';
  return json.decode(data);
}

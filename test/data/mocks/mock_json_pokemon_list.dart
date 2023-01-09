import 'dart:convert';

pokemonJsonData() {
  const String data = '''
{
	"count": 1154,
	"next": "https://pokeapi.co/api/v2/pokemon/?offset=25&limit=15",
	"previous": "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=10",
	"results": [
		{
			"name": "metapod",
			"url": "https://pokeapi.co/api/v2/pokemon/11/"
		},
		{
			"name": "butterfree",
			"url": "https://pokeapi.co/api/v2/pokemon/12/"
		},
		{
			"name": "weedle",
			"url": "https://pokeapi.co/api/v2/pokemon/13/"
		},
		{
			"name": "kakuna",
			"url": "https://pokeapi.co/api/v2/pokemon/14/"
		},
		{
			"name": "beedrill",
			"url": "https://pokeapi.co/api/v2/pokemon/15/"
		},
		{
			"name": "pidgey",
			"url": "https://pokeapi.co/api/v2/pokemon/16/"
		},
		{
			"name": "pidgeotto",
			"url": "https://pokeapi.co/api/v2/pokemon/17/"
		},
		{
			"name": "pidgeot",
			"url": "https://pokeapi.co/api/v2/pokemon/18/"
		},
		{
			"name": "rattata",
			"url": "https://pokeapi.co/api/v2/pokemon/19/"
		},
		{
			"name": "raticate",
			"url": "https://pokeapi.co/api/v2/pokemon/20/"
		},
		{
			"name": "spearow",
			"url": "https://pokeapi.co/api/v2/pokemon/21/"
		},
		{
			"name": "fearow",
			"url": "https://pokeapi.co/api/v2/pokemon/22/"
		},
		{
			"name": "ekans",
			"url": "https://pokeapi.co/api/v2/pokemon/23/"
		},
		{
			"name": "arbok",
			"url": "https://pokeapi.co/api/v2/pokemon/24/"
		},
		{
			"name": "pikachu",
			"url": "https://pokeapi.co/api/v2/pokemon/25/"
		}
	]
}
''';
  return json.decode(data);
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/data/pokemon/repositories/pokemon_remote_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_abilities_use_case.dart';

class MockPokemonRepository extends Mock implements PokemonRemoteRepository {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final pokemonRepository = MockPokemonRepository();

  final getPokemonAbilitiesUseCase =
      GetPokemonAbilitiesUseCaseImp(pokemonRepository: pokemonRepository);

  group(
    'getPokemonAbilitiesUseCase tests:',
    () {
      test(
        'when getPokemonsAbilities, should return pokemonAbilities entity',
        () async {
          final PokemonAbilities pokemonAbilities = PokemonAbilities(
            effectEntries: [
              EffectEntries(
                  effect: 'attack', language: Language(name: '', url: ''))
            ],
          );

          when(() => pokemonRepository.getPokemonAbilities(pokemonId: '25'))
              .thenAnswer(
            (_) async => pokemonAbilities,
          );

          final result = await getPokemonAbilitiesUseCase(pokemonId: '25');

          expect(result, pokemonAbilities);
        },
      );

      test(
        'when getPokemonsAbilities and response from repository is null, should return null',
        () async {
          when(() => pokemonRepository.getPokemonAbilities(pokemonId: '25'))
              .thenAnswer(
            (_) async => null,
          );

          final result = await getPokemonAbilitiesUseCase(pokemonId: '25');

          expect(result, null);
        },
      );
    },
  );
}

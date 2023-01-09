import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_abilities_use_case.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';

class MockGetPokemonAbilitiesUseCase extends Mock
    implements GetPokemonAbilitiesUseCase {}

void main() {
  final GetPokemonAbilitiesUseCase getPokemonAbilitiesUseCase =
      MockGetPokemonAbilitiesUseCase();

  group('PokemonAbilitiesCubit Success Case', () {
    blocTest<PokemonAbilitiesCubit, PokemonAbilitiesState>(
      'when calls pokemon abilities cubit with success, should emit loading and success state',
      build: () => PokemonAbilitiesCubit(
        getPokemonAbilitiesUseCase: getPokemonAbilitiesUseCase,
      ),
      setUp: () {
        when(() => getPokemonAbilitiesUseCase(pokemonId: '25')).thenAnswer(
          (_) async => PokemonAbilities(
            effectEntries: [
              EffectEntries(
                effect: 'effect',
                language: Language(
                  name: 'en',
                  url: '',
                ),
              )
            ],
          ),
        );
      },
      act: (cubit) => cubit.getPokemonAbilities(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonAbilitiesLoading>(),
        isA<PokemonAbilitiesSuccess>(),
      ],
    );
  });

  group('PokemonAbilitiesCubit Error Case', () {
    blocTest<PokemonAbilitiesCubit, PokemonAbilitiesState>(
      'when calls pokemon abilities cubit with null, should emit error state',
      build: () => PokemonAbilitiesCubit(
        getPokemonAbilitiesUseCase: getPokemonAbilitiesUseCase,
      ),
      setUp: () {
        when(() => getPokemonAbilitiesUseCase(pokemonId: '25'))
            .thenAnswer((_) async => null);
      },
      act: (cubit) => cubit.getPokemonAbilities(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonAbilitiesLoading>(),
        isA<PokemonAbilitiesError>(),
      ],
    );
  });

  group('PokemonAbilitiesCubit Empty Case', () {
    blocTest<PokemonAbilitiesCubit, PokemonAbilitiesState>(
      'when calls pokemon abilities cubit with empty Pokemon Abilities, should emit error state',
      build: () => PokemonAbilitiesCubit(
        getPokemonAbilitiesUseCase: getPokemonAbilitiesUseCase,
      ),
      setUp: () {
        when(() => getPokemonAbilitiesUseCase(pokemonId: '25'))
            .thenAnswer((_) async => PokemonAbilities(effectEntries: []));
      },
      act: (cubit) => cubit.getPokemonAbilities(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonAbilitiesLoading>(),
        isA<PokemonAbilitiesError>(),
      ],
    );
  });
}

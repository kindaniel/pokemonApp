import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/data/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_detail_use_case.dart';
import 'package:pokemon/presentation/pokemon_details/cubit/pokemon_detail_cubit.dart';

class MockGetPokemonDetailsUseCase extends Mock
    implements GetPokemonDetailsUseCase {}

void main() {
  final GetPokemonDetailsUseCase getPokemonDetailsUseCase =
      MockGetPokemonDetailsUseCase();

  group('PokemonAbilitiesCubit Success Case', () {
    blocTest<PokemonDetailsCubit, PokemonDetailsState>(
      'when calls pokemon abilities cubit with success, should emit success state',
      build: () => PokemonDetailsCubit(
        getPokemonDetailsUseCase: getPokemonDetailsUseCase,
      ),
      setUp: () {
        when(() => getPokemonDetailsUseCase(pokemonId: '25')).thenAnswer(
            (_) async => PokemonDetails(
                abilities: [],
                id: 1,
                stats: [],
                types: [],
                weight: 1,
                height: 5));
      },
      act: (cubit) => cubit.getPokemonDetails(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonDetailsLoading>(),
        isA<PokemonDetailsSuccess>(),
      ],
    );
  });

  group('PokemonAbilitiesCubit Error Case', () {
    blocTest<PokemonDetailsCubit, PokemonDetailsState>(
      'when calls pokemon abilities cubit with null, should emit error state',
      build: () => PokemonDetailsCubit(
        getPokemonDetailsUseCase: getPokemonDetailsUseCase,
      ),
      setUp: () {
        when(() => getPokemonDetailsUseCase(pokemonId: '25'))
            .thenAnswer((_) async => null);
      },
      act: (cubit) => cubit.getPokemonDetails(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonDetailsLoading>(),
        isA<PokemonDetailsError>(),
      ],
    );
  });

  group('PokemonAbilitiesCubit Empty Case', () {
    blocTest<PokemonDetailsCubit, PokemonDetailsState>(
      'when calls pokemon abilities cubit with null, should emit error state',
      build: () => PokemonDetailsCubit(
        getPokemonDetailsUseCase: getPokemonDetailsUseCase,
      ),
      setUp: () {
        when(() => getPokemonDetailsUseCase(pokemonId: '25')).thenAnswer(
          (_) async => PokemonDetails(
              abilities: [], id: 1, stats: [], types: [], weight: 1, height: 1),
        );
      },
      act: (cubit) => cubit.getPokemonDetails(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonDetailsLoading>(),
        isA<PokemonDetailsError>(),
      ],
    );
  });
}

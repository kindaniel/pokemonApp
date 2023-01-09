import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemons_use_case.dart';
import 'package:pokemon/presentation/pokemon_list/cubit/pokemon_list_cubit.dart';

class MockGetPokemonsUseCase extends Mock implements GetPokemonsUseCase {}

void main() {
  final GetPokemonsUseCase getPokemonsUseCase = MockGetPokemonsUseCase();

  group('PokemonListCubit Success Case', () {
    blocTest<PokemonListCubit, PokemonListState>(
      'when calls pokemon list cubit with success, should emit loading and success',
      build: () => PokemonListCubit(
        getPokemonsUseCase: getPokemonsUseCase,
      ),
      setUp: () {
        when(() => getPokemonsUseCase()).thenAnswer(
          (_) async => PokemonList(
            count: 1,
            next: '1',
            previous: '',
            pokemons: [Pokemon(id: '25', name: 'Pikachu', url: 'http://www')],
          ),
        );
      },
      act: (cubit) => cubit.getPokemons(),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonListSuccess>(),
      ],
    );
  });

  group('PokemonListCubit Error Case', () {
    blocTest<PokemonListCubit, PokemonListState>(
      'when calls pokemon list cubit with null, should emit error state',
      build: () => PokemonListCubit(
        getPokemonsUseCase: getPokemonsUseCase,
      ),
      setUp: () {
        when(() => getPokemonsUseCase()).thenAnswer((_) async => null);
      },
      act: (cubit) => cubit.getPokemons(),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonListError>(),
      ],
    );
  });

  group('PokemonListCubit Empty Case', () {
    blocTest<PokemonListCubit, PokemonListState>(
      'when calls pokemon list cubit with empty pokemon list, should emit error state',
      build: () => PokemonListCubit(
        getPokemonsUseCase: getPokemonsUseCase,
      ),
      setUp: () {
        when(() => getPokemonsUseCase()).thenAnswer(
          (_) async => PokemonList(
            count: 1,
            next: '1',
            previous: '',
            pokemons: [],
          ),
        );
      },
      act: (cubit) => cubit.getPokemons(),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonListError>(),
      ],
    );
  });
}

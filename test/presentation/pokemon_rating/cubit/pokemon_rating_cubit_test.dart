import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_rating_use_case.dart';
import 'package:pokemon/domain/pokemon/usecases/save_pokemon_rating_use_case.dart';
import 'package:pokemon/presentation/pokemon_rating/cubit/pokemon_rating_cubit.dart';

class MockGetPokemonRatingUseCase extends Mock
    implements GetPokemonRatingUseCase {}

class MockSavePokemonRatingUseCase extends Mock
    implements SavePokemonRatingUseCase {}

void main() {
  final GetPokemonRatingUseCase getPokemonRatingUseCase =
      MockGetPokemonRatingUseCase();
  final SavePokemonRatingUseCase savePokemonRatingUseCase =
      MockSavePokemonRatingUseCase();

  group('PokemonRatingCubit Success Case', () {
    blocTest<PokemonRatingCubit, PokemonRatingState>(
      'when calls pokemon get rating cubit with success, should emit success state',
      build: () => PokemonRatingCubit(
          getPokemonRatingUseCase: getPokemonRatingUseCase,
          savePokemonRatingUseCase: savePokemonRatingUseCase),
      setUp: () {
        when(() => getPokemonRatingUseCase(pokemonId: '25'))
            .thenAnswer((_) async => PokemonRating(id: '25', rating: 3.0));
      },
      act: (cubit) => cubit.getPokemonRating(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonRatingLoading>(),
        isA<PokemonRatingSuccess>(),
      ],
    );
  });
}

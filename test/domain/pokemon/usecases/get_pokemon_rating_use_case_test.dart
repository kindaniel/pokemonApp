import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/domain/pokemon/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_rating_use_case.dart';

class MockPokemonLocalRepository extends Mock
    implements PokemonLocalRepository {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final pokemonRepository = MockPokemonLocalRepository();

  final GetPokemonRatingUseCase getPokemonRatingUseCase =
      GetPokemonRatingUseCaseImpl(pokemonLocalRepository: pokemonRepository);

  group(
    'getPokemonRatingUseCase tests:',
    () {
      test(
        'when getPokemonRating, should return pokemonComments entity',
        () async {
          final PokemonRating pokemonRating =
              PokemonRating(id: '25', rating: 3.0);

          when(() => pokemonRepository.getRating(pokemonId: '25')).thenAnswer(
            (_) async => pokemonRating,
          );

          final result = await getPokemonRatingUseCase(pokemonId: '25');

          expect(result, pokemonRating);
        },
      );
    },
  );
}

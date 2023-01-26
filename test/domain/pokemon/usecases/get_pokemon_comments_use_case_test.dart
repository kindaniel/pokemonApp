import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/domain/pokemon/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_comments_use_case.dart';

class MockPokemonLocalRepository extends Mock
    implements PokemonLocalRepository {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final pokemonRepository = MockPokemonLocalRepository();

  final GetPokemonCommentsUseCase getPokemonCommentsUseCase =
      GetPokemonCommentsUseCaseImpl(pokemonLocalRepository: pokemonRepository);

  group(
    'getPokemonCommentsUseCase tests:',
    () {
      test(
        'when getPokemonComments, should return pokemonComments entity',
        () async {
          final PokemonComments pokemonComments = PokemonComments(
              id: '25', comments: ['comment1', 'comment2', 'comment3']);

          when(() => pokemonRepository.getComments(pokemonId: '25')).thenAnswer(
            (_) async => pokemonComments,
          );

          final result = await getPokemonCommentsUseCase(pokemonId: '25');

          expect(result, pokemonComments);
        },
      );
    },
  );
}

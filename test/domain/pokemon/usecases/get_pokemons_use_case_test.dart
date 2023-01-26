import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/domain/pokemon/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemons_use_case.dart';

class MockPokemonRepository extends Mock implements PokemonRemoteRepository {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final pokemonRepository = MockPokemonRepository();

  final getPokemonsUseCase =
      GetPokemonsUseCaseImp(pokemonRepository: pokemonRepository);

  group(
    'getPokemonListUseCase tests:',
    () {
      test(
        'when getPokemonsUseCase, should return list of pokemons entity',
        () async {
          final PokemonList pokemonList = PokemonList(
            count: 1,
            next: '1',
            previous: '',
            pokemons: [Pokemon(id: '25', name: 'Pikachu', url: 'http://www')],
          );

          when(() => pokemonRepository.getPokemons()).thenAnswer(
            (_) async => pokemonList,
          );

          final result = await getPokemonsUseCase();

          expect(result, isA<PokemonList>());
        },
      );
    },
  );
}

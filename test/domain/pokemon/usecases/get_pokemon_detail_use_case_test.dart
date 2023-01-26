import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/domain/pokemon/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_detail_use_case.dart';

class MockPokemonRepository extends Mock implements PokemonRemoteRepository {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final pokemonRepository = MockPokemonRepository();

  final getPokemonDetailsUseCase =
      GetPokemonDetailsUseCaseImp(pokemonRepository: pokemonRepository);

  group(
    'getPokemonAbilitiesUseCase tests:',
    () {
      test(
        'when getPokemonDEtails, should return pokemonDetails entity',
        () async {
          final PokemonDetails pokemonDetails = PokemonDetails(
            moves: [
              Moves(
                move: Move(name: 'attack', url: ''),
              ),
              Moves(
                move: Move(name: 'attack', url: ''),
              ),
            ],
            abilities: [
              Abilities(
                  ability: Ability(name: '', url: ''), isHidden: false, slot: 1)
            ],
            id: 1,
            stats: [],
            types: [],
            weight: 1,
            height: 5,
          );

          when(() => pokemonRepository.getPokemonDetails(pokemonId: '25'))
              .thenAnswer(
            (_) async => pokemonDetails,
          );

          final result = await getPokemonDetailsUseCase(pokemonId: '25');

          expect(result, pokemonDetails);
        },
      );

      test(
        'when getPokemonsAbilities and response from repository is null, should return null',
        () async {
          when(() => pokemonRepository.getPokemonDetails(pokemonId: '25'))
              .thenAnswer(
            (_) async => null,
          );

          final result = await getPokemonDetailsUseCase(pokemonId: '25');

          expect(result, null);
        },
      );
    },
  );
}

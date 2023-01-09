import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokemon/domain/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/domain/entities/pokemon_list.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/pokemon_details_page.dart';

class MockPokemonDetailsCubit extends MockCubit<PokemonDetailsState>
    implements PokemonDetailsCubit {}

class MockPokemonAbilitiesCubit extends MockCubit<PokemonAbilitiesState>
    implements PokemonAbilitiesCubit {}

void main() {
  late PokemonDetailsCubit pokemonDetailsCubit;
  late PokemonAbilitiesCubit pokemonAbilitiesCubit;

  setUp(
    () {
      pokemonDetailsCubit = MockPokemonDetailsCubit();
      pokemonAbilitiesCubit = MockPokemonAbilitiesCubit();
    },
  );

  testWidgets(
    'Pokemon details page, when loaded with success, should appers details of pokemon ',
    (widgetTester) async {
      whenListen(
        pokemonAbilitiesCubit,
        Stream<PokemonAbilitiesState>.fromIterable(
          [],
        ),
        initialState: PokemonAbilitiesSuccess(
          pokemonAbilities: PokemonAbilities(
            effectEntries: [
              EffectEntries(
                effect: 'effect',
                language: Language(
                  name: 'en',
                  url: '',
                ),
              ),
              EffectEntries(
                effect: 'effect',
                language: Language(
                  name: 'en',
                  url: '',
                ),
              )
            ],
          ),
        ),
      );
      whenListen(
        pokemonDetailsCubit,
        Stream<PokemonDetailsState>.fromIterable(
          [],
        ),
        initialState: PokemonDetailsSuccess(
          pokemonDetails: PokemonDetails(
            id: 1,
            abilities: [],
            moves: [
              Moves(
                move: Move(name: 'attack', url: ''),
              ),
              Moves(
                move: Move(name: 'attack', url: ''),
              ),
            ],
            stats: [],
            types: [
              Types(
                slot: 1,
                type: Type(name: '', url: ''),
              ),
              Types(
                slot: 2,
                type: Type(name: 'test', url: ''),
              )
            ],
            weight: 100,
            height: 100,
          ),
        ),
      );

      await mockNetworkImagesFor(() => widgetTester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: ScreenUtilInit(
                  designSize: const Size(393, 852),
                  // ignore: prefer_const_constructors
                  builder: (BuildContext context, _) => PokemonDetailsPage(
                    pokemon: Pokemon(
                      name: '',
                      url: '',
                      id: '25',
                    ),
                    pokemonAbilitiesCubit: pokemonAbilitiesCubit,
                    pokemonDetailsCubit: pokemonDetailsCubit,
                  ),
                ),
              ),
            ),
          ));

      expect(find.byType(Scaffold), findsNWidgets(2));
      expect(find.byType(NestedScrollView), findsNWidgets(1));
      expect(find.byType(SingleChildScrollView), findsNWidgets(1));
    },
  );

  testWidgets(
    'Pokemon List page, when loaded with error, should appers Lottie loading ',
    (widgetTester) async {
      whenListen(
          pokemonAbilitiesCubit,
          Stream<PokemonAbilitiesState>.fromIterable(
            [],
          ),
          initialState: PokemonAbilitiesError());
      whenListen(
          pokemonDetailsCubit,
          Stream<PokemonDetailsState>.fromIterable(
            [],
          ),
          initialState: PokemonDetailsError());

      await mockNetworkImagesFor(() => widgetTester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: ScreenUtilInit(
                  designSize: const Size(393, 852),
                  // ignore: prefer_const_constructors
                  builder: (BuildContext context, _) => PokemonDetailsPage(
                    pokemon: Pokemon(
                      name: '',
                      url: '',
                      id: '25',
                    ),
                    pokemonAbilitiesCubit: pokemonAbilitiesCubit,
                    pokemonDetailsCubit: pokemonDetailsCubit,
                  ),
                ),
              ),
            ),
          ));

      expect(find.byType(Scaffold), findsNWidgets(2));
      expect(find.byType(NestedScrollView), findsNWidgets(1));
      expect(find.byType(SingleChildScrollView), findsNWidgets(1));
      expect(find.byType(Lottie), findsNWidgets(1));
    },
  );
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_abilities.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:pokemon/presentation/pokemon_comments/cubit/pokemon_comment_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/pokemon_details_page.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/pokemon_success_widget.dart';
import 'package:pokemon/presentation/pokemon_rating/cubit/pokemon_rating_cubit.dart';

class MockPokemonDetailsCubit extends MockCubit<PokemonDetailsState>
    implements PokemonDetailsCubit {}

class MockPokemonAbilitiesCubit extends MockCubit<PokemonAbilitiesState>
    implements PokemonAbilitiesCubit {}

class MockPokemonRatingCubit extends MockCubit<PokemonRatingState>
    implements PokemonRatingCubit {}

class MockPokemonCommentCubit extends MockCubit<PokemonCommentState>
    implements PokemonCommentCubit {}

void main() {
  late PokemonDetailsCubit pokemonDetailsCubit;
  late PokemonAbilitiesCubit pokemonAbilitiesCubit;
  late PokemonRatingCubit pokemonRatingCubit;
  late PokemonCommentCubit pokemonCommentCubit;

  setUp(
    () {
      pokemonDetailsCubit = MockPokemonDetailsCubit();
      pokemonAbilitiesCubit = MockPokemonAbilitiesCubit();
      pokemonRatingCubit = MockPokemonRatingCubit();
      pokemonCommentCubit = MockPokemonCommentCubit();
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
            stats: [
              Stats(baseStat: 100, effort: 555, stat: Stat(name: '', url: ''))
            ],
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
      whenListen(
          pokemonRatingCubit,
          Stream<PokemonRatingState>.fromIterable(
            [],
          ),
          initialState: PokemonRatingSuccess(
              pokemonRating: PokemonRating(id: '25', rating: 3.0)));
      whenListen(
          pokemonCommentCubit,
          Stream<PokemonCommentState>.fromIterable(
            [],
          ),
          initialState: PokemonCommentSuccess(
              pokemonComments:
                  PokemonComments(comments: ['', '', ''], id: '25')));

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
                    pokemonRatingCubit: pokemonRatingCubit,
                    pokemonCommentCubit: pokemonCommentCubit,
                  ),
                ),
              ),
            ),
          ));

      expect(find.byType(PokemonSucessWidget), findsNWidgets(1));
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
      whenListen(
          pokemonRatingCubit,
          Stream<PokemonRatingState>.fromIterable(
            [],
          ),
          initialState: PokemonRatingSuccess(
              pokemonRating: PokemonRating(id: '25', rating: 3.0)));
      whenListen(
          pokemonCommentCubit,
          Stream<PokemonCommentState>.fromIterable(
            [],
          ),
          initialState: PokemonCommentSuccess(
              pokemonComments:
                  PokemonComments(comments: ['', '', ''], id: '25')));

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
                    pokemonRatingCubit: pokemonRatingCubit,
                    pokemonCommentCubit: pokemonCommentCubit,
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

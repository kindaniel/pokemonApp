import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:poke_design_system/widgets/poke_card.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/presentation/pokemon_list/cubit/pokemon_list_cubit.dart';
import 'package:pokemon/presentation/pokemon_list/pokemon_list_page.dart';

class MockPokemonListCubit extends MockCubit<PokemonListState>
    implements PokemonListCubit {}

void main() {
  late PokemonListCubit pokemonListCubit;

  setUp(
    () {
      pokemonListCubit = MockPokemonListCubit();
    },
  );

  testWidgets(
    'Pokemon List page, when loaded with success, should appears a GridView in page ',
    (widgetTester) async {
      whenListen(
        pokemonListCubit,
        Stream<PokemonListState>.fromIterable(
          [],
        ),
        initialState: PokemonListSuccess(
          pokemonList: PokemonList(
            count: 1000,
            next: '',
            previous: '',
            pokemons: [Pokemon(name: 'Pikachu', url: '', id: '25')],
          ),
        ),
      );
      await mockNetworkImagesFor(() => widgetTester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: ScreenUtilInit(
                  designSize: const Size(393, 852),
                  // ignore: prefer_const_constructors
                  builder: (BuildContext context, _) => BlocProvider(
                    create: (context) => pokemonListCubit,
                    child: const PokemonListPage(),
                  ),
                ),
              ),
            ),
          ));

      expect(find.byType(GridView), findsNWidgets(1));
      expect(find.byType(GestureDetector), findsNWidgets(1));
      expect(find.byType(Hero), findsNWidgets(1));
      expect(find.byType(PokeCard), findsNWidgets(1));
      expect(find.byType(Padding), findsNWidgets(5));
    },
  );

  testWidgets(
    'Pokemon List page, when loaded with error, should appears a Lottie File in Page',
    (widgetTester) async {
      whenListen(
          pokemonListCubit,
          Stream<PokemonListState>.fromIterable(
            [],
          ),
          initialState: PokemonListError());

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreenUtilInit(
                designSize: const Size(393, 852),
                // ignore: prefer_const_constructors
                builder: (BuildContext context, _) => BlocProvider(
                      create: (context) => pokemonListCubit,
                      child: const PokemonListPage(),
                    )),
          ),
        ),
      );

      expect(find.byType(Center), findsNWidgets(1));
      expect(find.byType(Lottie), findsNWidgets(1));
    },
  );
}

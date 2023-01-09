import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/locator.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/pokemon_details_page.dart';
import 'package:pokemon/presentation/pokemon_list/pokemon_list_page.dart';
import 'package:pokemon/presentation/splash/splash_page.dart';

import 'presentation/pokemon_details/cubit/pokemon_detail_cubit.dart';
import 'presentation/pokemon_list/cubit/pokemon_list_cubit.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon APP',
        theme: ThemeData(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          primarySwatch: Colors.red,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        routes: {
          "/": (context) => const SplashPage(),
          "/pokemon-list": (context) => PokemonListPage(
                pokemonListCubit: locator.get<PokemonListCubit>(),
              ),
          "/pokemon-detail-page": (context) => PokemonDetailsPage(
                pokemonAbilitiesCubit: locator.get<PokemonAbilitiesCubit>(),
                pokemonDetailsCubit: locator.get<PokemonDetailsCubit>(),
                pokemon: ModalRoute.of(context)!.settings.arguments as Pokemon,
              ),
        },
      ),
    );
  }
}

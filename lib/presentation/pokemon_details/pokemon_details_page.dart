import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/pokemon_success_widget.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/sliver_app_bar.dart';
import 'package:pokemon/presentation/pokemon_rating/cubit/pokemon_rating_cubit.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    super.key,
    required this.pokemon,
    required this.pokemonAbilitiesCubit,
    required this.pokemonDetailsCubit,
    required this.pokemonRatingCubit,
  });

  final PokemonAbilitiesCubit pokemonAbilitiesCubit;
  final PokemonDetailsCubit pokemonDetailsCubit;
  final PokemonRatingCubit pokemonRatingCubit;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[SliverAppBarPokemonDetails(pokemon: pokemon)];
      },
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                pokemonDetailsCubit..getPokemonDetails(pokemonId: pokemon.id),
          ),
          BlocProvider(
            create: (context) => pokemonAbilitiesCubit
              ..getPokemonAbilities(pokemonId: pokemon.id),
          ),
          BlocProvider(
            create: (context) =>
                pokemonRatingCubit..getPokemonRating(pokemonId: pokemon.id),
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
                builder: (context, state) {
                  if (state is PokemonDetailsSuccess) {
                    return BlocProvider.value(
                      value: BlocProvider.of<PokemonAbilitiesCubit>(context),
                      child: PokemonSucessWidget(
                        pokemonDetails: state.pokemonDetails,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.all(20.0.r),
                      child: Lottie.asset(
                        'assets/lottie/pokeball-loading-animation.json',
                        width: 45.r,
                        height: 45.r,
                      ),
                    );
                  }
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'how much you like this pokemon?',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff000000).withOpacity(0.76)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: BlocBuilder<PokemonRatingCubit, PokemonRatingState>(
                    builder: (context, state) {
                      if (state is PokemonRatingSuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              initialRating: state.pokemonRating.rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) async {
                                await pokemonRatingCubit.savePokemonRating(
                                  pokemonRating: rating,
                                  pokemonId: pokemon.id,
                                  comment: '',
                                );
                              },
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Text('Comments'),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextField(
                              maxLines: 3, //or null
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter your text here"),
                            ),
                            ElevatedButton(
                                onPressed: null, child: Text('Send comment'))
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

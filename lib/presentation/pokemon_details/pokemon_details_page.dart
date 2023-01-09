import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_design_system/theme/pokeds_colors.dart';
import 'package:pokemon/domain/entities/pokemon_list.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/base_stats_widget.dart';
import 'package:shimmer/shimmer.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    super.key,
    required this.pokemon,
    required this.pokemonAbilitiesCubit,
    required this.pokemonDetailsCubit,
  });

  final PokemonAbilitiesCubit pokemonAbilitiesCubit;
  final PokemonDetailsCubit pokemonDetailsCubit;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.h,
            floating: true,
            centerTitle: false,
            backgroundColor: PokedsColors.primaryColor,
            pinned: true,
            title: Text(pokemon.name,
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.h, right: 41.w),
                      child: Image.asset(
                        'assets/images/transparent_pokeball.png',
                        height: 208.h,
                        width: 208.w,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: pokemon.id,
                      child: Padding(
                        padding: EdgeInsets.only(top: 55.h, right: 16.w),
                        child: Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${pokemon.id}.png',
                          height: 190.h,
                          width: 180.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => pokemonDetailsCubit
                  ..getPokemonDetails(pokemonId: pokemon.id),
              ),
              BlocProvider(
                create: (context) => pokemonAbilitiesCubit
                  ..getPokemonAbilities(pokemonId: pokemon.id),
              ),
            ],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
                    builder: (context, state) {
                      if (state is PokemonDetailsSuccess) {
                        return Container(
                          padding: EdgeInsets.only(top: 20.h),
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 24.sp,
                                    maxWidth: 80.w,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: PokedsColors.primaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.pokemonDetails.types[0].type.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'About',
                                style: TextStyle(
                                  color: PokedsColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20.r),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${state.pokemonDetails.weight} kg',
                                          style: TextStyle(
                                            color: const Color(
                                              0xff212121,
                                            ),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        Text(
                                          'Weight',
                                          style: TextStyle(
                                            color: const Color(
                                              0xff212121,
                                            ),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 35.h,
                                    color: PokedsColors.primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${state.pokemonDetails.height} m',
                                          style: TextStyle(
                                            color: const Color(
                                              0xff212121,
                                            ),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        Text(
                                          'Height',
                                          style: TextStyle(
                                            color: const Color(
                                              0xff212121,
                                            ),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 35.h,
                                    color: PokedsColors.primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Text(
                                          state.pokemonDetails.moves[0].move
                                              .name,
                                          style: TextStyle(
                                            color: const Color(
                                              0xff212121,
                                            ),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        Text(
                                          'Move',
                                          style: TextStyle(
                                            color: const Color(
                                              0xff212121,
                                            ),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Base Stats',
                                style: TextStyle(
                                  color: PokedsColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              for (var stat in state.pokemonDetails.stats) ...[
                                BaseStatsWidget(
                                  name: stat.stat.name,
                                  value: stat.baseStat,
                                )
                              ]
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: Lottie.asset(
                            'assets/lottie/pokeball-loading-animation.json',
                            width: 45.r,
                            height: 45.r,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocBuilder<PokemonAbilitiesCubit, PokemonAbilitiesState>(
                    builder: (context, state) {
                      if (state is PokemonAbilitiesSuccess) {
                        return Column(
                          children: [
                            Text(
                              'Ability',
                              style: TextStyle(
                                color: PokedsColors.primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                state.pokemonAbilities.effectEntries[1].effect,
                                style: TextStyle(
                                  color: const Color(0xff212121),
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 23.h,
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
                                      color: const Color(0xff000000)
                                          .withOpacity(0.76)),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: RatingBar.builder(
                                  initialRating: 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        child: Text(
                          'Loading abilities...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 200.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_design_system/theme/pokeds_colors.dart';
import 'package:pokemon/data/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/locator.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/base_stats_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              color: PokedsColors.primaryColor,
            ),
            SafeArea(
              child: ListTile(
                title: Text(
                  pokemon.name,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
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
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: pokemon.id,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h, right: 16.w),
                    child: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${pokemon.id}.png',
                      height: 190.h,
                      width: 180.w,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                    bottomLeft: Radius.circular(48.r),
                    bottomRight: Radius.circular(48.r),
                  ),
                ),
                height: 550.h,
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => locator.get<PokemonDetailsCubit>()
                        ..getPokemonDetails(pokemonId: pokemon.id),
                    ),
                    BlocProvider(
                      create: (context) => locator.get<PokemonAbilitiesCubit>()
                        ..getPokemonAbilities(pokemonId: pokemon.id),
                    ),
                  ],
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BlocBuilder<PokemonDetailsCubit, PokemonDetailState>(
                          builder: (context, state) {
                            if (state is PokemonDetailSuccess) {
                              return Container(
                                padding: EdgeInsets.only(top: 56.h),
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
                                              state.pokemonDetails.types[0].type
                                                  .name,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                state.pokemonDetails.moves[0]
                                                    .move.name,
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
                                    for (var stat
                                        in state.pokemonDetails.stats) ...[
                                      BaseStatsWidget(
                                        name: stat.stat.name,
                                        value: stat.baseStat,
                                      )
                                    ]
                                  ],
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.only(top: 46.h),
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/lottie/pokeball-loading-animation.json',
                                    width: 45.r,
                                    height: 45.r,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        BlocBuilder<PokemonAbilitiesCubit,
                            PokemonAbilitiesState>(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      state.pokemonAbilities.effectEntries[1]
                                          .effect,
                                      style: TextStyle(
                                        color: const Color(0xff212121),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Container(
                              height: 100,
                              width: 100,
                              color: Colors.red,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

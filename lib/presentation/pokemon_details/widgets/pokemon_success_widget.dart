import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_design_system/theme/pokeds_colors.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_details.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/base_stats_widget.dart';
import 'package:shimmer/shimmer.dart';

class PokemonSucessWidget extends StatelessWidget {
  const PokemonSucessWidget({super.key, required this.pokemonDetails});

  final PokemonDetails pokemonDetails;

  @override
  Widget build(BuildContext context) {
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
                    pokemonDetails.types[0].type.name,
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
                      '${pokemonDetails.weight} kg',
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
                      '${pokemonDetails.height} m',
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
                      pokemonDetails.moves[0].move.name,
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
          BlocBuilder<PokemonAbilitiesCubit, PokemonAbilitiesState>(
            builder: (context, state) {
              if (state is PokemonAbilitiesSuccess) {
                return Column(
                  children: [
                    Text(
                      key: const Key('ability'),
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
          for (var stat in pokemonDetails.stats) ...[
            BaseStatsWidget(
              name: stat.stat.name,
              value: stat.baseStat,
            ),
          ],
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}

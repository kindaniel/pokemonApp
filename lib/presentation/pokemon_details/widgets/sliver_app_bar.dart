import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_design_system/theme/pokeds_colors.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';

class SliverAppBarPokemonDetails extends StatelessWidget {
  const SliverAppBarPokemonDetails({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}

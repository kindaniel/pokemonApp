import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_design_system/theme/pokeds_colors.dart';
import 'package:pokemon/data/pokemon/entities/pokemon_list.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

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
                      height: 180.h,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

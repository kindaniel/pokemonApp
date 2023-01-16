import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_rating.dart';
import 'package:pokemon/presentation/pokemon_rating/cubit/pokemon_rating_cubit.dart';

class PokemonRatingWidget extends StatelessWidget {
  const PokemonRatingWidget(
      {super.key, required this.pokemonRating, required this.pokemonId});

  final PokemonRating pokemonRating;
  final String pokemonId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        RatingBar.builder(
          initialRating: pokemonRating.rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) async {
            await BlocProvider.of<PokemonRatingCubit>(context)
                .savePokemonRating(
              pokemonRating: rating,
              pokemonId: pokemonId,
            );
          },
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

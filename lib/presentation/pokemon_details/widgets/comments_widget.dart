import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_design_system/theme/pokeds_colors.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key, required this.pokemonComments});

  final PokemonComments pokemonComments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var comment in pokemonComments.comments) ...[
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: PokedsColors.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            child: ListTile(
              title: Text(
                comment,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: const Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          )
        ],
        SizedBox(
          height: 200.h,
        ),
      ],
    );
  }
}

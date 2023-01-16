import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/presentation/pokemon_comments/cubit/pokemon_comment_cubit.dart';

class CommentsHeader extends StatelessWidget {
  CommentsHeader({super.key, required this.pokemonId});

  final TextEditingController commentController =
      TextEditingController(text: "");

  final String pokemonId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: commentController,
          validator: (value) {
            if (value != null && value.isEmpty) {
              return 'Comment anything';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF3F4F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            errorMaxLines: 6,
            hintText: 'comment',
            prefixIcon: Icon(
              Icons.comment,
              size: 15.r,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () async {
                BlocProvider.of<PokemonCommentCubit>(context).saveComment(
                  pokemonId: pokemonId,
                  comment: commentController.text,
                );

                BlocProvider.of<PokemonCommentCubit>(context)
                    .getComments(pokemonId: pokemonId);
              },
              child: const Text('Send'),
            ),
          ),
        ),
      ],
    );
  }
}

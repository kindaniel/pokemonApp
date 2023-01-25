import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_design_system/widgets/poke_input.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/presentation/pokemon_abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:pokemon/presentation/pokemon_comments/cubit/pokemon_comment_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/comments_widget.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/pokemon_rating_widget.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/pokemon_success_widget.dart';
import 'package:pokemon/presentation/pokemon_details/widgets/sliver_app_bar.dart';
import 'package:pokemon/presentation/pokemon_rating/cubit/pokemon_rating_cubit.dart';

class PokemonDetailsPage extends StatelessWidget {
  PokemonDetailsPage(
      {super.key,
      required this.pokemon,
      required this.pokemonAbilitiesCubit,
      required this.pokemonDetailsCubit,
      required this.pokemonRatingCubit,
      required this.pokemonCommentCubit});

  final PokemonAbilitiesCubit pokemonAbilitiesCubit;
  final PokemonDetailsCubit pokemonDetailsCubit;
  final PokemonRatingCubit pokemonRatingCubit;
  final PokemonCommentCubit pokemonCommentCubit;
  final Pokemon pokemon;

  final TextEditingController commentController =
      TextEditingController(text: "");

  final formKey = GlobalKey<FormState>();

  String Function(String)? _validateField(value) {
    if (value != null && value.isEmpty || value!.length < 3) {
      return value;
    }
    return null;
  }

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
          BlocProvider(
            create: (context) =>
                pokemonCommentCubit..getComments(pokemonId: pokemon.id),
          ),
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                BlocBuilder<PokemonRatingCubit, PokemonRatingState>(
                  builder: (context, state) {
                    if (state is PokemonRatingSuccess) {
                      return PokemonRatingWidget(
                        pokemonId: pokemon.id,
                        pokemonRating: state.pokemonRating,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const Text('Comments'),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: formKey,
                  child: InputWidget(
                    controller: commentController,
                    validator: ((value) {
                      if (value != null && value.isEmpty || value!.length < 3) {
                        return 'informe ao menos 3 caracteres';
                      }
                      return null;
                    }),
                    hintText: 'comment',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await pokemonCommentCubit.saveComment(
                            pokemonId: pokemon.id,
                            comment: commentController.text,
                          );

                          await pokemonCommentCubit.getComments(
                              pokemonId: pokemon.id);
                        }
                      },
                      child: const Text('Send'),
                    ),
                  ),
                ),
                BlocBuilder<PokemonCommentCubit, PokemonCommentState>(
                  builder: (context, state) {
                    if (state is PokemonCommentSuccess) {
                      return CommentsWidget(
                        pokemonComments: state.pokemonComments,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

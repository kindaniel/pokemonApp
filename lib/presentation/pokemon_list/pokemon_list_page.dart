import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_design_system/widgets/poke_app_bar.dart';
import 'package:poke_design_system/widgets/poke_card.dart';
import 'package:pokemon/presentation/pokemon_list/cubit/pokemon_list_cubit.dart';

class PokemonListPage extends StatelessWidget {
  final PokemonListCubit pokemonListCubit;
  PokemonListPage({super.key, required this.pokemonListCubit});

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PokeAppBar(
        title: 'Pokébot',
        image: 'assets/images/header_pokeball.png',
      ),
      body: BlocProvider(
        create: (context) => pokemonListCubit..getPokemons(),
        child: BlocBuilder<PokemonListCubit, PokemonListState>(
          builder: (context, state) {
            if (state is PokemonListSuccess) {
              return Padding(
                padding: EdgeInsets.all(16.r),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 130.r,
                    childAspectRatio: 1.5.r,
                    crossAxisSpacing: 10.r,
                    mainAxisSpacing: 10.r,
                    mainAxisExtent: 150.r,
                  ),
                  controller: scrollController,
                  itemCount: state.pokemonList.pokemons.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final pokemon = state.pokemonList.pokemons[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/pokemon-detail-page',
                            arguments: state.pokemonList.pokemons[index]);
                      },
                      child: Hero(
                        tag: pokemon.id,
                        child: PokeCard(
                          pokemonName: pokemon.name,
                          pokemonImage:
                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${pokemon.id}.png',
                        ),
                      ),
                    );
                  },
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
      ),
    );
  }
}

import 'package:get_it/get_it.dart';
import 'package:pokemon/data/pokemon/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemons_use_case.dart';
import 'package:pokemon/presentation/pokemon_list/cubit/pokemon_list_cubit.dart';

final locator = GetIt.instance;

void registerDependencies() {
  locator.registerFactory<PokemonRepository>(() => PokemonRepositoryImpl());

  locator.registerFactory<GetPokemonsUseCase>(
    () => GetPokemonsUseCaseImp(
      pokemonRepository: locator.get<PokemonRepository>(),
    ),
  );

  locator.registerFactory<PokemonListCubit>(
    () => PokemonListCubit(
      getPokemonsUseCase: locator.get<GetPokemonsUseCase>(),
    ),
  );
}

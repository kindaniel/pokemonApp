import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/domain/pokemon/entities/pokemon_comments.dart';
import 'package:pokemon/domain/pokemon/usecases/get_pokemon_comments_use_case.dart';
import 'package:pokemon/domain/pokemon/usecases/save_pokemon_comment_use_case.dart';
import 'package:pokemon/presentation/pokemon_comments/cubit/pokemon_comment_cubit.dart';

class MockGetPokemonCommentsUseCase extends Mock
    implements GetPokemonCommentsUseCase {}

class MockSavePokemonCommentsUseCase extends Mock
    implements SavePokemonCommentsUseCase {}

void main() {
  final GetPokemonCommentsUseCase getPokemonCommentsUseCase =
      MockGetPokemonCommentsUseCase();

  final SavePokemonCommentsUseCase savePokemonCommentsUseCase =
      MockSavePokemonCommentsUseCase();

  group('PokemonComments Success Case', () {
    blocTest<PokemonCommentCubit, PokemonCommentState>(
      'when calls pokemon comments cubit with success, should emit loading and success state',
      build: () => PokemonCommentCubit(
        getPokemonCommentsUseCase: getPokemonCommentsUseCase,
        savePokemonCommentsUseCase: savePokemonCommentsUseCase,
      ),
      setUp: () {
        when(() => getPokemonCommentsUseCase(pokemonId: '25')).thenAnswer(
            (_) async => PokemonComments(
                id: '25', comments: ['comment1, comment2, comment3']));
      },
      act: (cubit) => cubit.getComments(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonCommentLoading>(),
        isA<PokemonCommentSuccess>(),
      ],
    );
  });

  group('PokemonComments Empty Case', () {
    blocTest<PokemonCommentCubit, PokemonCommentState>(
      'when calls pokemon comments cubit with comments empty, should emit loading and Empty state',
      build: () => PokemonCommentCubit(
        getPokemonCommentsUseCase: getPokemonCommentsUseCase,
        savePokemonCommentsUseCase: savePokemonCommentsUseCase,
      ),
      setUp: () {
        when(() => getPokemonCommentsUseCase(pokemonId: '25'))
            .thenAnswer((_) async => PokemonComments(id: '25', comments: []));
      },
      act: (cubit) => cubit.getComments(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonCommentLoading>(),
        isA<PokemonCommentsEmpty>(),
      ],
    );
  });

  group('PokemonComments Error Case', () {
    blocTest<PokemonCommentCubit, PokemonCommentState>(
      'when calls pokemon comments cubit with error, should emit loading and error state',
      build: () => PokemonCommentCubit(
        getPokemonCommentsUseCase: getPokemonCommentsUseCase,
        savePokemonCommentsUseCase: savePokemonCommentsUseCase,
      ),
      setUp: () {
        when(() => getPokemonCommentsUseCase(pokemonId: '25'))
            .thenAnswer((_) async => throw Error());
      },
      act: (cubit) => cubit.getComments(pokemonId: '25'),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<PokemonCommentLoading>(),
        isA<PokemonCommentError>(),
      ],
    );
  });

  group('PokemonComments Save Case', () {
    blocTest<PokemonCommentCubit, PokemonCommentState>(
      'when calls cubit to save a comment',
      build: () => PokemonCommentCubit(
        getPokemonCommentsUseCase: getPokemonCommentsUseCase,
        savePokemonCommentsUseCase: savePokemonCommentsUseCase,
      ),
      setUp: () {
        when(() =>
                savePokemonCommentsUseCase(pokemonId: '25', comment: 'comment'))
            .thenAnswer((_) async => []);
      },
      act: (cubit) => cubit.saveComment(pokemonId: '25', comment: ''),
      wait: const Duration(milliseconds: 500),
      expect: () => [],
    );
  });
}

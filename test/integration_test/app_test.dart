import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pokemon/main.dart' as app;
import 'package:poke_design_system/widgets/poke_input.dart';

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding
        .ensureInitialized(); // Cria o inicializador e faz o binding com o Driver do Flutter
    testWidgets("Full test", (tester) async {
      app.main();
      await tester
          .pumpAndSettle(); // Espera que qualquer mudança de tela tenha sido realizada

      final pokeCard = find.byKey(const Key("pokeCard")).first;

      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(pokeCard);

      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 1));

      final pokeRating = find.byType(RatingBar).first;

      final pokeInput = find.byType(InputWidget).first;

      await Future.delayed(const Duration(seconds: 2));

      tester.tap(pokeRating);

      await Future.delayed(const Duration(seconds: 2));
      tester.tap(pokeInput);
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(pokeInput, 'the test like this pokemon!');

      await Future.delayed(const Duration(seconds: 5));
    });
  });
}

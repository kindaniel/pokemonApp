import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pokemon/main.dart' as app;

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

      final pokeRating = find.byType(RatingBar).first;

      await Future.delayed(const Duration(seconds: 2));

      tester.tap(pokeRating);

      await Future.delayed(const Duration(seconds: 5));
    });
  });
}

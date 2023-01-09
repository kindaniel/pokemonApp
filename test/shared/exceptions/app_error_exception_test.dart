import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/shared/exceptions/app_error_exception.dart';

void main() {
  group('App Error Exception tests', () {
    test('Should return correct error code and error message', () async {
      final appErrorException = AppErrorException(code: 404, message: 'Erro');

      expect(appErrorException.code, 404);
      expect(appErrorException.message, 'Erro');
    });
  });
}

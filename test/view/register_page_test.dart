import 'package:flutter_test/flutter_test.dart';

import 'email_validator_test.dart';
import 'password_validator_page_test.dart';

class Auth {
  register(String? email, String? password) {
    final emailError = EmailValidator().validate(email: email);
    final passwordError = PasswordValidator().validate(password: password);

    return emailError ?? passwordError;
  }
}

void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });

  group(
    'validação do cadastro', 
    () {

      test(
        'deve retornar uma mensagem para um email e senha inválidos',
        () {

          final result = auth.register('Matheus', '123');

          expect(result, isA<String>());
        }
      );

test(
        'deve retornar uma mensafem para um email e senha inválidos',
        () {

          final result = auth.register('Matheus@gmail.com', 'Matheus123');

          expect(result, isNull);
        }
      );

     },
    );
}
import 'package:flutter_test/flutter_test.dart';

class PasswordValidator {
 String? validate({String? password}) {
    if (password == null || password == '') {
      return 'A senha é obrigatória';
    }

    if (password.length < 8) {
      return 'A senha deve possuir pelo menos 8 caracteres';
    }

    final alphanumeric = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).+$');
    if (!alphanumeric.hasMatch(password)) {
      return 'A senha deve ser alfanúmerica';

    }

    final specialCharacter = RegExp(r'^(?=.*[!@#\$&*~]).+$');
    if (!specialCharacter.hasMatch(password)) {
      return 'A senha deve conter pelo menos um caractere especial';
    }


    return null; 
    
  }
}

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });

  group('validação da senha', () {
    test('deve retornar uma mensagem de erro caso a senha seja null', () {
      final result = passwordValidator.validate();

      expect(result, equals('A senha é obrigatória'));
    });

    test('deve retornar uma mensagem de erro caso a senha seja vazia', () {
      final result = passwordValidator.validate(password: '');

      expect(result, equals('A senha é obrigatória'));
    });

    test('deve retornar uma mensagem de erro caso a senha seja menor que 8 caracteres', () {
      final result = passwordValidator.validate(password: 'Ana');

      expect(result, equals('A senha deve possuir pelo menos 8 caracteres'));
    });
  
  test('deve retornar uma mensagem de erro caso a senha não seja alfanúmerica', () {
      final result = passwordValidator.validate(password: 'LaercioUnasp');

      expect(result, equals('A senha deve ser alfanúmerica'));
    });

    test('deve retornar null caso a senha seja vãlida', () {
      final result = passwordValidator.validate(password: 'MatheusOli123');

      expect(result, isNull);
    });
    test('deve retornar null caso a senha seja válida', () {
      final result = passwordValidator.validate(password: 'MatheusOli123!');

      expect(result, isNull);
    });
  });
}


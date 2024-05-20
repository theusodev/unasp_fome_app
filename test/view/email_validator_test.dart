import 'package:flutter_test/flutter_test.dart';

class EmailValidator {
  String? validate({String? email}) {
    if (email == null || email == '') {
      return 'O e-mail é obrigatório';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'O e-mail é inválido';
    }

    return null; // Adicione um retorno padrão para evitar erros
  }
}

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });

  group('validação do e-mail', () {
    test('Deve retornar uma mensagem de erro caso o email seja null', () {
      print('Executando teste: email null');
      final result = emailValidator.validate();
      print('Resultado: $result');
      expect(result, equals('O e-mail é obrigatório'));
    });

    test('Deve retornar uma mensagem de erro caso o email seja vazio', () {
      print('Executando teste: email vazio');
      final result = emailValidator.validate(email: '');
      print('Resultado: $result');
      expect(result, equals('O e-mail é obrigatório'));
    });

    test('Deve retornar uma mensagem de erro caso o email seja inválido', () {
      print('Executando teste: email inválido');
      final result = emailValidator.validate(email: 'Laercio');
      print('Resultado: $result');
      expect(result, equals('O e-mail é inválido'));
    });
  
test('Deve retornar null caso o e-mail seja válido', () {
      print('Executando teste: email inválido');
      final result = emailValidator.validate(email: 'Laercio@gmail.com');
      print('Resultado: $result');
        expect(result, isNull);
       }
      );
    }
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unasp_fome_app/view/confirmar_pedido_page.dart';
import 'package:unasp_fome_app/view/endereco_envio_page.dart';

void main() {
  group('EnderecoEnvioPage Tests', () {
    testWidgets('Exibe todos os campos principais', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(MaterialApp(home: EnderecoEnvioPage()));

      // Act
      // Nada a fazer nesta etapa

      // Assert
      expect(find.text('Nome Completo'), findsOneWidget);
      expect(find.text('Telefone'), findsOneWidget);
      expect(find.text('Endereço'), findsOneWidget);
      expect(find.text('CEP'), findsOneWidget);
      expect(find.text('Complemento'), findsOneWidget);
    });

    testWidgets('Valida campos e navega para ConfirmarPedidoPage quando os dados são válidos', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(MaterialApp(home: EnderecoEnvioPage()));

      // Act
      await tester.enterText(find.byType(TextFormField).at(0), 'João da Silva');
      await tester.enterText(find.byType(TextFormField).at(1), '11999999999');
      await tester.enterText(find.byType(TextFormField).at(2), 'Rua Teste, 123');
      await tester.enterText(find.byType(TextFormField).at(3), '12345678');
      await tester.enterText(find.byType(TextFormField).at(4), 'Apto 101');

      await tester.tap(find.text('Adicionar endereço'));
      await tester.pumpAndSettle(); // Aguarda a navegação acontecer

      // Assert
      expect(find.byType(ConfirmarPedidoPage), findsOneWidget);
    });

    testWidgets('Mostra erro de validação quando o nome é inválido', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(MaterialApp(home: EnderecoEnvioPage()));

      // Act
      await tester.enterText(find.byType(TextFormField).at(0), 'J');
      await tester.tap(find.text('Adicionar endereço'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Insira no mínimo 3 caracteres'), findsOneWidget);
    });

    testWidgets('Mostra erro de validação quando o telefone é inválido', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(MaterialApp(home: EnderecoEnvioPage()));

      // Act
      await tester.enterText(find.byType(TextFormField).at(1), '123');
      await tester.tap(find.text('Adicionar endereço'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Insira um telefone válido'), findsOneWidget);
    });

    testWidgets('Mostra erro de validação quando o CEP é inválido', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(MaterialApp(home: EnderecoEnvioPage()));

      // Act
      await tester.enterText(find.byType(TextFormField).at(3), '123');
      await tester.tap(find.text('Adicionar endereço'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Insira um CEP válido'), findsOneWidget);
    });
  });
}

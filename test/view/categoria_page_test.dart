import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unasp_fome_app/view/categoria_page.dart'; // Importe o arquivo que contém a CategoriaPage

void main() {
  group('CategoriaPage', () {
    testWidgets('Deve renderizar a página de categoria corretamente', (WidgetTester tester) async {
      // Monta a página de categoria
      await tester.pumpWidget(MaterialApp(home: CategoriaPage(categoria: 'Categoria', items: [])));

      // Verifica se a página foi renderizada sem erros
      expect(tester.takeException(), isNull);

      // Verifica se o título da página está presente
      expect(find.text('Categoria'), findsOneWidget);
    });
  });
}

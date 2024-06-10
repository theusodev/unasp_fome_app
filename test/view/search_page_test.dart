import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unasp_fome_app/view/search_page.dart'; // Importe o arquivo que contém a SearchPage

void main() {
  group('SearchPage', () {
    testWidgets('Deve renderizar a página de pesquisa corretamente', (WidgetTester tester) async {
      // Monta a página de pesquisa
      await tester.pumpWidget(MaterialApp(home: SearchPage()));

      // Verifica se a página foi renderizada sem erros
      expect(tester.takeException(), isNull);

      // Verifica se o título da página está presente
      expect(find.text('Pesquisar'), findsOneWidget);
    });
  });
}


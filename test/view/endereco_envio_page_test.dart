import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unasp_fome_app/view/endereco_envio_page.dart';

void main() {
  group('EnderecoEnvioPage', () {
    // Testes serão adicionados aqui
  });
}
    
    
testWidgets('Deve carregar a página de envio de endereço corretamente', (WidgetTester tester) async {
  // Monta a tela do endereço de envio
  await tester.pumpWidget(MaterialApp(home: EnderecoEnvioPage()));

  // Verifica se o título "Envio" está presente na barra de aplicativos
  expect(find.text('Envio'), findsOneWidget);

  // Verifica se os campos de entrada estão presentes na tela
  expect(find.byKey(Key('nome_field')), findsOneWidget);
  expect(find.byKey(Key('telefone_field')), findsOneWidget);
  expect(find.byKey(Key('endereco_field')), findsOneWidget);
  expect(find.byKey(Key('cep_field')), findsOneWidget);
  expect(find.byKey(Key('complemento_field')), findsOneWidget);

  // Verifica se o botão "Adicionar endereço" está presente na tela
  expect(find.text('Adicionar endereço'), findsOneWidget);
});

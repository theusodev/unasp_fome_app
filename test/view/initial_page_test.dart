import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/common/produtos_view.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/initial_page.dart';

void main() {
  group('InitialPage', () {
    testWidgets('Deve renderizar corretamente', (WidgetTester tester) async {
      try {
        // Monta a página inicial com o Provider
        await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider(
              create: (_) => CartModel(),
              child: InitialPage(),
            ),
          ),
        );

        // Verifica se a página foi renderizada sem erros
        expect(find.byType(InitialPage), findsOneWidget);
        expect(find.text("Bem-vindo"), findsOneWidget);
        expect(find.text("Sugestões do Cheff"), findsOneWidget);
      } catch (e) {
        print('Exception during test: $e');
        rethrow;
      }
    });

    testWidgets('Deve exibir mensagem de erro ao carregar produto com falha', (tester) async {
  // Cria um modelo de carrinho
  final cartModel = CartModel();

  // Monta a página inicial com o modelo de carrinho
  await tester.pumpWidget(
    MaterialApp(
      home: ChangeNotifierProvider.value(
        value: cartModel,
        child: InitialPage(),
      ),
    ),
  );

  // Simula o clique em um produto
  await tester.tap(find.byType(ProdutosPage).first);
  await tester.pumpAndSettle();

  
});


    testWidgets('Deve exibir os produtos do carrinho corretamente', (WidgetTester tester) async {
      // Cria um modelo de carrinho com produtos
      final cartModel = CartModel();
      cartModel.addItem(['Produto Teste', '10.00', 'assets/imagem.png', 'Descrição do Produto', 'assets/imagem.png']);

      try {
        // Monta a página inicial com o modelo de carrinho
        await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider.value(
              value: cartModel,
              child: InitialPage(),
            ),
          ),
        );

        // Verifica se os produtos do carrinho são exibidos corretamente
        expect(find.byType(ProdutosPage), findsWidgets);
      } catch (e) {
        print('Exception during test: $e');
        rethrow;
      }
    });

    testWidgets('Deve exibir mensagem de erro ao atualizar quantidade com falha', (tester) async {
  // Cria um modelo de carrinho
  final cartModel = CartModel();

  // Monta a página inicial com o modelo de carrinho
  await tester.pumpWidget(
    MaterialApp(
      home: ChangeNotifierProvider.value(
        value: cartModel,
        child: InitialPage(),
      ),
    ),
  );

  });
});


}
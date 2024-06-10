import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/cart_page.dart';
import 'package:unasp_fome_app/view/produto_detalhes_page.dart';


void main() {
  group('ProdutoDetalhesPage', () {
    testWidgets('Deve renderizar a página de detalhes do produto corretamente', (WidgetTester tester) async {
      // Mock data do produto
      const produtoNome = 'Produto Teste';
      const produtoPreco = '10.00';
      const produtoDescricao = 'Descrição do produto teste';

      // Mock de CartModel
      final cartModel = CartModel();

      // Monta a página de detalhes do produto com CartModel
      await tester.pumpWidget(
        ChangeNotifierProvider<CartModel>.value(
          value: cartModel,
          child: MaterialApp(
            home: ProdutoDetalhesPage(
              produtoNome: produtoNome,
              produtoPreco: produtoPreco,
              produtoDescricao: produtoDescricao,
            ),
          ),
        ),
      );

      // Verifica se o nome do produto é exibido
      expect(find.text(produtoNome), findsOneWidget);

      // Verifica se o preço do produto é exibido
      expect(find.text('R\$ $produtoPreco'), findsOneWidget);

      // Verifica se a descrição do produto é exibida
      expect(find.text(produtoDescricao), findsOneWidget);

      // Verifica se o botão "Ir para Carrinho" está presente
      expect(find.text('Ir para Carrinho'), findsOneWidget);
    });

    testWidgets('Deve adicionar e remover produtos do carrinho', (WidgetTester tester) async {
      // Mock de CartModel
      final cartModel = CartModel();

      // Mock data do produto
      const produtoNome = 'Produto Teste';
      const produtoPreco = '10.00';

      // Monta a página de detalhes do produto com CartModel
      await tester.pumpWidget(
        ChangeNotifierProvider<CartModel>.value(
          value: cartModel,
          child: MaterialApp(
            home: ProdutoDetalhesPage(
              produtoNome: produtoNome,
              produtoPreco: produtoPreco,
            ),
          ),
        ),
      );

      // Verifica se a quantidade inicial é 0
      expect(find.text('0'), findsOneWidget);

      // Adiciona um produto ao carrinho
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Verifica se a quantidade foi atualizada para 1
      expect(find.text('1'), findsOneWidget);

      // Remove um produto do carrinho
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();

      // Verifica se a quantidade foi atualizada para 0
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Deve navegar para a página do carrinho ao clicar no botão "Ir para Carrinho"', (WidgetTester tester) async {
      // Mock de CartModel
      final cartModel = CartModel();

      // Mock Navigator
      await tester.pumpWidget(
        ChangeNotifierProvider<CartModel>.value(
          value: cartModel,
          child: MaterialApp(
            home: ProdutoDetalhesPage(
              produtoNome: 'Produto Teste',
              produtoPreco: '10.00',
            ),
            routes: {
              '/cart': (context) => CartPage(),
            },
          ),
        ),
      );

      // Simula o clique no botão "Ir para Carrinho"
      await tester.tap(find.widgetWithText(MaterialButton, 'Ir para Carrinho'));
      await tester.pumpAndSettle();

      // Verifica se a navegação para a página do carrinho ocorreu
      expect(find.byType(CartPage), findsOneWidget);
    });
  });
}

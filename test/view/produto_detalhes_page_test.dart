import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/cart_page.dart';
import 'package:unasp_fome_app/view/produto_detalhes_page.dart';
import 'package:mockito/mockito.dart';

// Criação de um mock para CartModel
class MockCartModel extends Mock implements CartModel {}

void main() {
  // Criação de um widget para envolver o ProdutoDetalhesPage com o Provider
  Widget createWidgetUnderTest({required CartModel cartModel}) {
    return ChangeNotifierProvider<CartModel>.value(
      value: cartModel,
      child: MaterialApp(
        home: ProdutoDetalhesPage(
          produtoNome: 'Produto Teste',
          produtoPreco: '99.99',
          produtoImagem: 'assets/images/produto.jpg',
          produtoDescricao: 'Descrição do produto teste',
          produtoItem: ['Produto Teste', '99.99'],
        ),
      ),
    );
  }

  group('ProdutoDetalhesPage', () {
    testWidgets('Renderiza os elementos principais do produto', (WidgetTester tester) async {
      await tester.runAsync(() async {
        final cartModel = MockCartModel();

        // Mocking the getQuantidade method to return a default value
        when(cartModel.getQuantidade(any)).thenReturn(1);

        await tester.pumpWidget(createWidgetUnderTest(cartModel: cartModel));
        await tester.pumpAndSettle();

        // Verificação de que os elementos principais são renderizados
        expect(find.text('Produto Teste'), findsOneWidget);
        expect(find.text('Descrição do produto teste'), findsOneWidget);
        expect(find.text('R\$ 99.99'), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      });
    });

    testWidgets('Navegação para a página do carrinho', (WidgetTester tester) async {
      await tester.runAsync(() async {
        final cartModel = MockCartModel();

        // Mocking the getQuantidade method to return a default value
        when(cartModel.getQuantidade(any)).thenReturn(1);

        await tester.pumpWidget(createWidgetUnderTest(cartModel: cartModel));
        await tester.pumpAndSettle();

        final goToCartButton = find.text('Ir para Carrinho');

        // Toca no botão "Ir para Carrinho" e verifica a navegação
        await tester.tap(goToCartButton);
        await tester.pumpAndSettle();

        expect(find.byType(CartPage), findsOneWidget);
      });
    });
  });
}

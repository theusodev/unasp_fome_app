import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // Lista de produtos
  final List<List<dynamic>> produtosItens = [
    ["Lanche Natural", "6.00", "assets/images/lanchenatural.png", "Nosso lanche natural, feito com ingredientes frescos, pão integral, proteínas magras e vegetais crocantes, oferece uma opção saudável e deliciosa para qualquer hora do dia.", "assets/images/lanchenaturaldetalhes.png", "Lanches"],
    ["Bolinho de Grão de Bico", "7.50", "assets/images/bolinhograodebico.png", "Nosso bolinho de grão de bico é uma opção saborosa e saudável, crocante por fora e macio por dentro, perfeito para qualquer ocasião.", "assets/images/bolinhodetalhes.png", "Lanches"],
    ["Croassaint", "6.00", "assets/images/croassaint.png", "Nosso croissant é leve, crocante e amanteigado, proporcionando uma experiência deliciosa e autêntica a cada mordida.", "assets/images/crossaintdetalhes.png", "Café da manhã"],
    ["Suco Natural de Laranja", "4.00", "assets/images/suconatural.png", "Melhor suco do mundo", "assets/images/sucodetalhes.png", "Bebidas"],
    ["Suco Natural de Manga", "4.00", "assets/images/sucodemanga.jpg", "Suco de manga é ruim", "assets/images/sucodemanga.jpg", "Bebidas"],
    ["Espaguete a Bolonhesa", "30.00", "assets/images/espaguete.png", "Espaguete a Bolonhesa, macarrão com carne é bom", "assets/images/espaguete.png", "Almoço"],
    ["Strogonoff Vegetariano", "25.00", "assets/images/strogonoff.png", "Strogonoff de frango de verdade é bem melhor", "assets/images/strogonoff.png", "Almoço"],
  ];

  // Lista de produtos no carrinho
  List<List<dynamic>> _itensCart = [];

  // Lista de pedidos feitos
  List<List<List<dynamic>>> _historicoPedidos = [];

  // Getter para itens no carrinho
  List<List<dynamic>> get items => _itensCart;

  // Getter para histórico de pedidos
  List<List<List<dynamic>>> get historicoPedidos => _historicoPedidos;

  // Adicionar no carrinho
  void addItem(List<dynamic> item) {
    _itensCart.add(item);
    notifyListeners();
  }

  // Remover do carrinho
  void removeItens(int index) {
    _itensCart.removeAt(index);
    notifyListeners();
  }

  // Calcular preço total
  String calcularTotal() {
    double precoTotal = 0;
    for (int i = 0; i < _itensCart.length; i++) {
      precoTotal += double.parse(_itensCart[i][1]);
    }
    return precoTotal.toStringAsFixed(2);
  }

  // Confirmar pedido e adicionar ao histórico
  void confirmarPedido() {
    _historicoPedidos.add(List.from(_itensCart));
    _itensCart.clear();
    notifyListeners();
  }

  // Repetir pedido
  void refazerPedido(List<List<dynamic>> pedido) {
    _itensCart = List.from(pedido);
    notifyListeners();
  }
}

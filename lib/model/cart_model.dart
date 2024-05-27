import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//AQUI É O MODEL DE CARRINHO, ONDE ADICIONAMOS OS PRODUTOS QUE VÃO PRA TELA INICIAL E CARRINHO

class CartModel extends ChangeNotifier {
  //lista de produtos
  final List produtosItens = [
    // [produtoNome, produtoPreco, produtoImagem]
    ["Lanche Natural", "6.00", "assets/images/lanchenatural.png","O lanche natual é gostoso demais"],
    ["Bolinho de Grão de Bico", "7.50", "assets/images/bolinhograodebico.png", "O boliinho é 1000grau"],
    ["Croassaint", "6.00", "assets/images/croassaint.png", "Croassaint de frango é melhor"],
    ["Suco Natural de Laranja", "4.00", "assets/images/suconatural.png", "Melhor suco do mundo"],
    ["Suco Natural de Manga", "4.00", "assets/images/suconatural.png", "Suco de"],
  ];

  //lista de produtos no carrinho
  List _itensCart = [];

  //get produtosItens => _produtosItens;

  get itensCart => _itensCart;

  //adicionar no carrinho
  void addItens(int index) {
    _itensCart.add(produtosItens[index]);
    notifyListeners();
  }

  //remover do carrinho
  void removeItens(int index) {
    _itensCart.removeAt(index);
    notifyListeners();
  }
  //calcular preço total
  String calcularTotal() {
    double precoTotal = 0;
    for (int i = 0; i <_itensCart.length; i++) {
      precoTotal += double.parse(_itensCart[i][1]);
    } 
    return precoTotal.toStringAsFixed(2);
  }
}
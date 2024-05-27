import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//AQUI É O MODEL DE CARRINHO, ONDE ADICIONAMOS OS PRODUTOS QUE VÃO PRA TELA INICIAL E CARRINHO

class CartModel extends ChangeNotifier {
  //lista de produtos
  final List produtosItens = [
    // [produtoNome, produtoPreco, produtoImagem]
    ["Lanche Natural", "6.00", "assets/images/lanchenatural.png"],
    ["Bolinho de Grão de Bico", "7.50", "assets/images/bolinhograodebico.png"],
    ["Croassaint", "6.00", "assets/images/croassaint.png"],
    ["Suco Natural de Laranja", "4.00", "assets/images/suconatural.png"],
    ["Suco Natural de Manga", "4.00", "assets/images/suconatural.png"],
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
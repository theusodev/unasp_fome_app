import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //lista de produtos
  final List _produtosItens = [
    // [produtoNome, produtoPreco, produtoImagem]
    ["Google 1", "10.00", "assets/images/Google_Login.png"],
    ["Google 2", "20.00", "assets/images/Google_Login.png"],
    ["Google 3", "30.00", "assets/images/Google_Login.png"],
  ];

  //lista de produtos no carrinho
  List _itensCart = [];

  get produtosItens => _produtosItens;

  get itensCart => _itensCart;

  //adicionar no carrinho
  void addItens(int index) {
    _itensCart.add(_produtosItens[index]);
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
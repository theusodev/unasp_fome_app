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

  get produtosItens => _produtosItens;
}
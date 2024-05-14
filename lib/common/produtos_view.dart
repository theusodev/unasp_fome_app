import 'package:flutter/cupertino.dart';

class ProdutosPage extends StatelessWidget {

  final String produtoNome;
  final String produtoPreco;
  final String produtoImagem;

  const ProdutosPage({
    super.key,
    required this.produtoNome,
    required this.produtoPreco,
    required this.produtoImagem
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        //imagem
        Text(produtoNome)
        
        //nome
        
        
        //preço
      ]),
    );
  }
}
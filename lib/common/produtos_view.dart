import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatelessWidget {

  final String produtoNome;
  final String produtoPreco;
  final String produtoImagem;
  void Function()? onPressed;

  ProdutosPage({
    super.key,
    required this.produtoNome,
    required this.produtoPreco,
    required this.produtoImagem,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //imagem
          Image.asset(produtoImagem,
          height: 64,),
          
          //nome
          Text(produtoNome),
          
          //preço
          MaterialButton(onPressed: onPressed,
          color: Colors.orange,
          child: Text("R\$ " + produtoPreco,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          )),)
        ]),
      ),
    );
  }
}
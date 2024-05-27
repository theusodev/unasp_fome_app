import 'package:flutter/material.dart';

class ProdutoDetalhesPage extends StatelessWidget {
  final String produtoNome;
  final String produtoPreco;
  final String produtoImagem;
  final String produtoDescricao;

  const ProdutoDetalhesPage({
    super.key,
    required this.produtoNome,
    required this.produtoPreco,
    required this.produtoImagem,
    required this.produtoDescricao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produtoNome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(produtoImagem,
            ),
            SizedBox(height: 16),
            Text(
              produtoNome,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Preço: $produtoPreco",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              produtoDescricao,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

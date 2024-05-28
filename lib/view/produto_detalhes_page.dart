import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';

class ProdutoDetalhesPage extends StatelessWidget {
  final String produtoNome;
  final String produtoPreco;
  final String produtoImagem;
  final String produtoDescricao;
  final int produtoIndex;

  const ProdutoDetalhesPage({
    super.key,
    required this.produtoNome,
    required this.produtoPreco,
    required this.produtoImagem,
    required this.produtoDescricao,
    required this.produtoIndex,
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
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(produtoImagem, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 16),
            Text(
              produtoNome,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              produtoDescricao,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 16),
            SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "R\$ $produtoPreco",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
            SizedBox(height: 16),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false)
                          .addItens(produtoIndex);
                    },
                    child: Text("Adicionar ao Carrinho"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

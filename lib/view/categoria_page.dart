import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/produto_detalhes_page.dart';
import 'package:unasp_fome_app/common/produtos_view.dart';

class CategoriaPage extends StatelessWidget {
  final String categoria;
  final List<List<dynamic>> items;

  CategoriaPage({required this.categoria, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.80 / 1,
        ),
        itemBuilder: (context, index) {
          return ProdutosPage(
            produtoNome: items[index][0],
            produtoPreco: items[index][1],
            produtoImagem: items[index][2],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProdutoDetalhesPage(
                    produtoNome: items[index][0],
                    produtoPreco: items[index][1],
                    produtoImagem: items[index][4],
                    produtoDescricao: items[index][3],
                    produtoIndex: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

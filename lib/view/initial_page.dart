import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/common/produtos_view.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/produto_detalhes_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});
  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Bem-vindo",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Últimos pedidos",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            SizedBox(height: 26),
            SizedBox(
              height: kToolbarHeight,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    7,
                    (index) => Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/images/Google_Login.png',
                          fit: BoxFit.cover,
                        ))),
              ),
            ),
            SizedBox(height: 26),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sugestões do Cheff",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 1,
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: value.produtosItens.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2.80 / 1,
                    ),
                    itemBuilder: (context, index) {
                      return ProdutosPage(
                        produtoNome: value.produtosItens[index][0],
                        produtoPreco: value.produtosItens[index][1],
                        produtoImagem: value.produtosItens[index][2],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProdutoDetalhesPage(
                                produtoNome: value.produtosItens[index][0],
                                produtoPreco: value.produtosItens[index][1],
                                produtoImagem: value.produtosItens[index][2],
                                produtoDescricao: value.produtosItens[index][3], // Assumindo que a descrição está no índice 3
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/cart_page.dart';

class ProdutoDetalhesPage extends StatefulWidget {
  final String produtoNome;
  final String produtoPreco;
  final String produtoImagem;
  final String produtoDescricao;
  final List<dynamic> produtoItem;

  const ProdutoDetalhesPage({
    super.key,
    required this.produtoNome,
    required this.produtoPreco,
    required this.produtoImagem,
    required this.produtoDescricao,
    required this.produtoItem,
  });

  @override
  _ProdutoDetalhesPageState createState() => _ProdutoDetalhesPageState();
}

class _ProdutoDetalhesPageState extends State<ProdutoDetalhesPage> {
  int _quantidade = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    _quantidade = cart.getQuantidade(widget.produtoNome);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produtoNome),
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
                child: Image.asset(widget.produtoImagem, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.produtoNome,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.produtoDescricao,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "R\$ ${widget.produtoPreco}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (_quantidade > 0) {
                            cart.removeItem(widget.produtoItem);
                          }
                        });
                      },
                    ),
                    Text(
                      '$_quantidade',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          cart.addItem(widget.produtoItem);
                        });
                      },
                    ),
                  ],
                ),
                MaterialButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    //Lógica de adicionar no carinho
                    // cart.addItem(widget.produtoItem);
                    // setState(() {
                    //   _quantidade = cart.getQuantidade(widget.produtoNome);
                    // });
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CartPage()),
                            );
                  },
                  child: Text("Ir para Carrinho"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

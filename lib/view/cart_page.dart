import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/checkout_page.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Meu carrinho",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoricoPedidosPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lista de itens do carrinho
              Expanded(
                child: ListView.builder(
                  itemCount: cartModel.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            cartModel.items[index][2],
                            height: 36,
                          ),
                          title: Text(cartModel.items[index][0]),
                          subtitle: Text('R\$ ' + cartModel.items[index][1]),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () => cartModel.removeItens(index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Botão cinza de valor total no final da tela
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Preço
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Valor total",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "R\$ " + cartModel.calcularTotal(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                              child: Text(
                                "Pagar",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HistoricoPedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico de Pedidos"),
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          return ListView.builder(
            itemCount: cartModel.historicoPedidos.length,
            itemBuilder: (context, index) {
              var pedido = cartModel.historicoPedidos[index];
              return GestureDetector(
                onTap: () {
                  cartModel.refazerPedido(pedido);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cartpage(),
                    ),
                  );
                },
                child: ExpansionTile(
                  title: Text("Pedido ${index + 1}"),
                  children: pedido.map<Widget>((item) {
                    return ListTile(
                      leading: Image.asset(
                        item[2],
                        height: 36,
                      ),
                      title: Text(item[0]),
                      subtitle: Text('R\$ ' + item[1]),
                    );
                  }).toList(),
              ));
            },
          );
        },
      ),
    );
  }
}

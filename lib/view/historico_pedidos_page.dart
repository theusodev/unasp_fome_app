import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/cart_page.dart';

class HistoricoPedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico de Pedidos"),
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          if (cartModel.historicoPedidos.isEmpty) {
            return Center(
              child: Text(
                "Sem produtos no histórico",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: cartModel.historicoPedidos.length,
              itemBuilder: (context, index) {
                var pedido = cartModel.historicoPedidos[index];
                var precoTotal = cartModel.calcularTotalPedido(pedido);
                return GestureDetector(
                  onTap: () {
                    cartModel.refazerPedido(pedido);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  child: ExpansionTile(
                    title: Text("Pedido ${index + 1} - Total: R\$ $precoTotal"),
                    children: pedido.entries.map<Widget>((entry) {
                      var item = entry.key;
                      var quantidade = entry.value;
                      return ListTile(
                        leading: Image.asset(
                          item[2],
                          height: 36,
                        ),
                        title: Text(item[0]),
                        subtitle: Text('R\$ ${item[1]}'),
                        trailing: Text('Qtd: $quantidade'),
                      );
                    }).toList(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/model/payment_model.dart';
import 'package:unasp_fome_app/view/checkout_page.dart';
import 'package:unasp_fome_app/view/endereco_envio_page.dart';
import 'package:unasp_fome_app/view/pedido_confirmado_sucesso.dart';

class ConfirmarPedidoPage extends StatelessWidget {
  final String nome;
  final String telefone;
  final String endereco;
  final String cep;
  final String complemento;

  const ConfirmarPedidoPage({
    Key? key,
    required this.nome,
    required this.telefone,
    required this.endereco,
    required this.cep,
    required this.complemento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Confirmar pedido",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer2<CartModel, PaymentModel>(
        builder: (context, cartModel, paymentModel, child) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),

                    // CAMPO ENDEREÇO DE ENVIO
                    Text(
                      "Endereço de envio",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                nome,
                                style: TextStyle(fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EnderecoEnvioPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Editar",
                                  style: TextStyle(fontSize: 18, color: Colors.orange),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            endereco,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            cep,
                            style: TextStyle(fontSize: 16),
                          ),
                          if (complemento.isNotEmpty)
                            Text(
                              complemento,
                              style: TextStyle(fontSize: 16),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Forma de pagamento",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Editar",
                            style: TextStyle(fontSize: 18, color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.orange[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            paymentModel.selectedPaymentIcon,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          paymentModel.selectedPaymentMethod,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Divider(height: 40),
                    Text(
                      "Resumo do Pedido",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartModel.items.length,
                      itemBuilder: (context, index) {
                        final item = cartModel.items.keys.elementAt(index);
                        final quantidade = cartModel.items[item];
                        return ListTile(
                          leading: Image.asset(item[2]),
                          title: Text(item[0]),
                          subtitle: Text('Qtd: $quantidade'),
                          trailing: Text('R\$ ${double.parse(item[1]) * quantidade!}'),
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "R\$ ${cartModel.calcularTotal()}",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            cartModel.confirmarPedido();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PedidoConfirmadoSucesso(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            "Confirmar pedido",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

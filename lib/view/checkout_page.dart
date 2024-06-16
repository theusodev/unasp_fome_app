import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/model/payment_model.dart';
import 'package:unasp_fome_app/view/endereco_envio_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _type = 1;

  void _handleRadio(Object? e) {
    setState(() {
      _type = e as int;
    });
    final paymentModel = Provider.of<PaymentModel>(context, listen: false);
    switch (_type) {
      case 1:
        paymentModel.setPaymentMethod('Débito', Icons.credit_card);
        break;
      case 2:
        paymentModel.setPaymentMethod('Crédito', Icons.credit_card);
        break;
      case 3:
        paymentModel.setPaymentMethod('Dinheiro', Icons.money);
        break;
      case 4:
        paymentModel.setPaymentMethod('Pix', Icons.qr_code);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Pagamento",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      _buildPaymentOption(
                        context,
                        size,
                        "Débito",
                        Icons.credit_card,
                        1,
                      ),
                      SizedBox(height: 15),
                      _buildPaymentOption(
                        context,
                        size,
                        "Crédito",
                        Icons.credit_card,
                        2,
                      ),
                      SizedBox(height: 15),
                      _buildPaymentOption(
                        context,
                        size,
                        "Dinheiro",
                        Icons.money,
                        3,
                      ),
                      SizedBox(height: 15),
                      _buildPaymentOption(
                        context,
                        size,
                        "Pix",
                        Icons.qr_code,
                        4,
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "O pagamento será efetuado no momento da entrega.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),)
                          
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Text(
                            "R\$ " + value.calcularTotal(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Divider(height: 16, color: Colors.black),
                      SizedBox(height: 50),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EnderecoEnvioPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            "Confirmar pagamento",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentOption(
      BuildContext context, Size size, String text, IconData icon, int value) {
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
          border: _type == value
              ? Border.all(width: 1, color: Colors.orange)
              : Border.all(width: 0.3, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                  value: value,
                  groupValue: _type,
                  onChanged: _handleRadio,
                  activeColor: Colors.orange,
                ),
                Text(text,
                    style: _type == value
                        ? TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)
                        : TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
              ],
            ),
            Icon(icon)
          ],
        ),
      ),
    );
  }
}

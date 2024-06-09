import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/home_page.dart';

class PedidoConfirmadoSucesso extends StatelessWidget {
  const PedidoConfirmadoSucesso({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 300,
                color: Colors.green,
              ),
              Text("Sucesso!",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
              Text("Seu pedido chegará em breve.",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
              Text("Obrigado!",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).confirmarPedido();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              child: Text(
                "Continuar",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PedidoConfirmadoSucesso extends StatelessWidget {
  const PedidoConfirmadoSucesso({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline)
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatelessWidget {
  final String produtoNome;
  final String produtoPreco;
  final String produtoImagem;
  void Function()? onPressed;

  ProdutosPage(
      {super.key,
      required this.produtoNome,
      required this.produtoPreco,
      required this.produtoImagem,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black, width: 1)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Row(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                  ),
                  //imagem
                  SizedBox(
                    child: Image.asset(
                      produtoImagem,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    //nome
                    SizedBox(
                      child: Text(
                        produtoNome,
                        softWrap: true,
                        style: TextStyle(fontSize: 14, color: Colors.blue[900], fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  SizedBox(
                    height: 25,
                    width: 70,
                    child: MaterialButton(
                      onPressed: onPressed,
                      color: Colors.orange,
                      child: Text("R\$ " + produtoPreco,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/common/produtos_view.dart';
import 'package:unasp_fome_app/model/cart_model.dart';

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
        title: const Text("Tela inicial"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //titulo bem vindo
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Bem-Vindo",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 16),

            //titulo ultimos pedidos
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Últimos pedidos",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),

            SizedBox(height: 26),

            //barra com ultimos produtos comprados
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

            //sugestoes do chef
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sugestões do Cheff",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),

            //PRESTA ATENÇÃO AQUI
            Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      padding: EdgeInsets.all(12),
                      itemCount: value.produtosItens.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1.8/ 1),
                        itemBuilder: (context, index) {
                          return ProdutosPage(
                            produtoNome: value.produtosItens[index][0],
                            produtoPreco: value.produtosItens[index][1],
                            produtoImagem: value.produtosItens[index][2],
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                .addItens(index);
                            },
                          );
                        });
                  },
                ))
          ],
        ),
      ),
    );
  }
}

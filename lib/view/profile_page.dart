import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //essa é a view da tela de perfil
      appBar: AppBar(
        title: Text("Meu perfil",
        style: TextStyle(fontSize: 36,
        fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //o drawer é o botao de tres linhas que abre uma aba na lateral e tem as opções dentro
      drawer: Drawer(
        child: ListView(children: [
          ListTile(leading: Icon(Icons.logout), title: Text("Deslogar"), onTap: () {
            AutenticacaoService().deslogar();
            GoogleSignIn().signOut();
          },)
        ],),
      ),
    );
  }
}
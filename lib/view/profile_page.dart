import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela de perfil"),
        backgroundColor: Colors.orange,
      ),
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
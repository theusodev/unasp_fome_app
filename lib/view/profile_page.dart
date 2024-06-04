import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';
import 'package:unasp_fome_app/view/login_page.dart'; // Certifique-se de importar a página de login

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu perfil",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Deslogar"),
              onTap: () async {
                await AutenticacaoService().deslogar();
                await GoogleSignIn().signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // Redireciona para a página de login
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

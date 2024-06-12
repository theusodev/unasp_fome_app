import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/providers/user_provider.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';
import 'package:unasp_fome_app/view/historico_pedidos_page.dart';

class ProfilePage extends StatelessWidget {
  // Custom input decoration
  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      errorStyle: TextStyle(fontSize: 18.0),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context).userData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu perfil',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                // redirecionamento de tela de volta para o login
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()), // Redireciona para a página de login
                //   (Route<dynamic> route) => false,
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Histórico de pedidos"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoricoPedidosPage(),
                    ));
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: inputDecoration('Nome'),
              controller: TextEditingController(text: userData['nome']),
              readOnly: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: inputDecoration('Data de Nascimento'),
              controller: TextEditingController(text: userData['nascimento']),
              readOnly: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: inputDecoration('CPF'),
              controller: TextEditingController(text: userData['cpf']),
              readOnly: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: inputDecoration('E-mail'),
              controller: TextEditingController(text: userData['email']),
              readOnly: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: inputDecoration('Telefone'),
              controller: TextEditingController(text: userData['telefone']),
              readOnly: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: inputDecoration('Endereço'),
              controller: TextEditingController(text: userData['endereco']),
              readOnly: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: inputDecoration('Complemento'),
              controller: TextEditingController(text: userData['complemento']),
              readOnly: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: inputDecoration('CEP'),
              controller: TextEditingController(text: userData['cep']),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}

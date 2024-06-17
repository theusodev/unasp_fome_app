import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/providers/user_provider.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';
import 'package:unasp_fome_app/view/historico_pedidos_page.dart';
import 'package:unasp_fome_app/view/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _nascimentoController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _complementoController = TextEditingController();
  final _cepController = TextEditingController();

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
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    await Provider.of<UserProvider>(context, listen: false).loadUserData();
    final userData = Provider.of<UserProvider>(context, listen: false).userData;

    _nomeController.text = userData['nome'] ?? '';
    _nascimentoController.text = userData['nascimento'] ?? '';
    _cpfController.text = userData['cpf'] ?? '';
    _emailController.text = userData['email'] ?? '';
    _telefoneController.text = userData['telefone'] ?? '';
    _enderecoController.text = userData['endereco'] ?? '';
    _complementoController.text = userData['complemento'] ?? '';
    _cepController.text = userData['cep'] ?? '';
  }

  Future<void> _saveUserData() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).update({
          'nome': _nomeController.text,
          'nascimento': _nascimentoController.text,
          'cpf': _cpfController.text,
          'email': _emailController.text,
          'telefone': _telefoneController.text,
          'endereco': _enderecoController.text,
          'complemento': _complementoController.text,
          'cep': _cepController.text,
        });

        Provider.of<UserProvider>(context, listen: false).setUserData({
          'nome': _nomeController.text,
          'nascimento': _nascimentoController.text,
          'cpf': _cpfController.text,
          'email': _emailController.text,
          'telefone': _telefoneController.text,
          'endereco': _enderecoController.text,
          'complemento': _complementoController.text,
          'cep': _cepController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Dados atualizados com sucesso!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                try {
                  await AutenticacaoService().deslogar();
                  //await GoogleSignIn().signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                } catch (e) {
                  print("Erro ao deslogar: $e");
                }
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<UserProvider>(context, listen: false).loadUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: inputDecoration('Nome'),
                      controller: _nomeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nome é obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration('Data de Nascimento'),
                      controller: _nascimentoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Data de Nascimento é obrigatória';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration('CPF'),
                      controller: _cpfController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'CPF é obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration('E-mail'),
                      controller: _emailController,
                      readOnly: true,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration('Telefone'),
                      controller: _telefoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Telefone é obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration('Endereço'),
                      controller: _enderecoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Endereço é obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration('Complemento'),
                      controller: _complementoController,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration('CEP'),
                      controller: _cepController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'CEP é obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveUserData,
                      child: Text('Salvar alterações',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

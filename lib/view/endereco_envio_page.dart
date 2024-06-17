import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasp_fome_app/providers/user_provider.dart';
import 'package:unasp_fome_app/view/confirmar_pedido_page.dart';

class EnderecoEnvioPage extends StatefulWidget {
  @override
  _EnderecoEnvioPageState createState() => _EnderecoEnvioPageState();
}

class _EnderecoEnvioPageState extends State<EnderecoEnvioPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cepController = TextEditingController();
  final _complementoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    await Provider.of<UserProvider>(context, listen: false).loadUserData();
    final userData = Provider.of<UserProvider>(context, listen: false).userData;

    _nomeController.text = userData['nome'] ?? '';
    _telefoneController.text = userData['telefone'] ?? '';
    _enderecoController.text = userData['endereco'] ?? '';
    _cepController.text = userData['cep'] ?? '';
    _complementoController.text = userData['complemento'] ?? '';
  }

  Future<void> _saveUserData() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).update({
          'nome': _nomeController.text,
          'telefone': _telefoneController.text,
          'endereco': _enderecoController.text,
          'cep': _cepController.text,
          'complemento': _complementoController.text,
        });

        Provider.of<UserProvider>(context, listen: false).setUserData({
          'nome': _nomeController.text,
          'telefone': _telefoneController.text,
          'endereco': _enderecoController.text,
          'cep': _cepController.text,
          'complemento': _complementoController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Endereço atualizado com sucesso!')));
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Editar endereço de envio",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome';
                    }
                    if (value.length < 3) {
                      return 'Insira no mínimo 3 caracteres';
                    }
                    return null; // Nome válido
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _telefoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira um telefone válido';
                    }
                    String phone = value.replaceAll(RegExp(r'[^\d]'), '');
                    if (phone.length != 11) {
                      return 'Insira um telefone válido';
                    }
                    return null; // Telefone válido
                  },
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _enderecoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira seu endereço';
                    }
                    return null; // Endereço válido
                  },
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _cepController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira seu CEP';
                    }
                    String cep = value.replaceAll(RegExp(r'[^\d]'), '');
                    if (cep.length != 8) {
                      return 'Insira um CEP válido';
                    }
                    return null; // CEP válido
                  },
                  decoration: InputDecoration(
                    labelText: 'CEP',
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _complementoController,
                  validator: (value) {
                    return null; // Complemento válido
                  },
                  decoration: InputDecoration(
                    labelText: 'Complemento',
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: _saveUserData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Salvar Endereço",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

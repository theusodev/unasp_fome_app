import 'package:flutter/material.dart';
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
  // void dispose() {
  //   _nomeController.dispose();
  //   _telefoneController.dispose();
  //   _enderecoController.dispose();
  //   _cepController.dispose();
  //   _complementoController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Envio",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Campo de nome
                TextFormField(
                  controller: _nomeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome';
                    }
                    if (!RegExp(r'^[a-zA-ZÀ-ÿ\s]+$').hasMatch(value)) {
                      return 'Insira um nome válido';
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
                // Campo de telefone
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
                // Campo de endereço
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
                // Campo de CEP
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
                // Campo de complemento
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
                // Botão de adicionar endereço
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmarPedidoPage(
                              nome: _nomeController.text,
                              telefone: _telefoneController.text,
                              endereco: _enderecoController.text,
                              cep: _cepController.text,
                              complemento: _complementoController.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Adicionar endereço",
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

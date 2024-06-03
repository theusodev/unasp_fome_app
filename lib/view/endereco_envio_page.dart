import 'package:flutter/material.dart';
import 'package:unasp_fome_app/view/confirmar_pedido_page.dart';

class EnderecoEnvioPage extends StatelessWidget {
  const EnderecoEnvioPage({super.key});

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
          child: Column(
            children: [
              
              //campo de nome
              TextFormField(
                //controller: _nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome';
                  }
                  // Verifica se contém apenas letras e espaços
                  if (!RegExp(r'^[a-zA-ZÀ-ÿ\s]+$').hasMatch(value)) {
                    return 'Insira um nome válido';
                  }
                  // Verifica se tem pelo menos 3 caracteres
                  if (value.length < 3) {
                    return 'Insira no mínimo 3 caracteres';
                  }
                  return null; // Nome válido
                },
                decoration: InputDecoration(
                    //hintText: 'Insira seu nome completo',
                    labelText: 'Nome Completo',
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                            BorderRadius.all(Radius.circular(100.0)))),
              ),
              
              SizedBox(height: 20),
              
              //campo de telefone
              TextFormField(
                //controller: _telefoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira um telefone válido';
                  }
                  // Remove todos os caracteres que não são dígitos
                  String phone = value.replaceAll(RegExp(r'[^\d]'), '');
                  // Verifica se o telefone tem 11 dígitos
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
                        borderRadius: BorderRadius.all(Radius.circular(100)))),
              ),
              
              SizedBox(height: 20),
              
              //campo de endereço
              TextFormField(
                //controller: _enderecoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira seu endereço';
                  }
                  return null; // Endereço válido
                },
                decoration: InputDecoration(
                    //hintText: 'Insira seu nome completo',
                    labelText: 'Endereço',
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                            BorderRadius.all(Radius.circular(100.0)))),
              ),
              
              SizedBox(height: 20),
              
              //campo de CEP
              TextFormField(
                //controller: _cepController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira seu CEP';
                  }
                  // Remove todos os caracteres que não são dígitos
                  String cep = value.replaceAll(RegExp(r'[^\d]'), '');
                  // Verifica se o CEP tem 8 dígitos
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
                        borderRadius: BorderRadius.all(Radius.circular(100)))),
              ),
              
              SizedBox(height: 20),
              
              //campo de complemento
              TextFormField(
                //controller: _complementoController,
                validator: (value) {
                  // Se o campo de complemento estiver preenchido, não há problema
                  if (value != null && value.isNotEmpty) {
                    return null; // Complemento válido
                  }
                  // Se estiver vazio, não exibe uma mensagem de erro
                  return null;
                },
                decoration: InputDecoration(
                    //hintText: 'Insira seu nome completo',
                    labelText: 'Complemento',
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                            BorderRadius.all(Radius.circular(100.0)))),
              ),
              
              SizedBox(height: 30),
              
              //campo de add endereço
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmarPedidoPage()));
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
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

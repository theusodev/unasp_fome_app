// ignore_for_file: prefer_const_constructors, camel_case_types, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:unasp_fome_app/view/home_page.dart';
import 'package:unasp_fome_app/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.all(16.0), //essa merda aqui é a distancia das bordas

        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                //espaço do topo
                SizedBox(height: 16.0),

                //ICONE
                Align(
                  alignment: Alignment
                      .topCenter, // Alinhe a imagem à parte superior central
                  child: Image.asset(
                    'assets/images/Logo_Login.png', // Substitua pelo caminho correto da sua imagem
                    width: 250, // Largura da imagem
                    height: 250, // Altura da imagem
                  ),
                ),

                //campo do email
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      errorStyle: TextStyle(fontSize: 18.0),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(color: Colors.red,
                          width: 2)),                      
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                  validator: (String? value) {
                    if (value == null) {
                      return "Insira um e-mail válido";
                    }
                    if (value.length < 5) {
                      return "O e-mail é muito curto";
                    }
                    if (!value.contains("@")) {
                      return "O e-mail não é valido";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                //CAMPO SENHA
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      errorStyle: TextStyle(fontSize: 18.0),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(color: Colors.red,
                          width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                  validator: (String? value) {
                    if (value == null) {
                      return "Insira uma senha válida";
                    }
                    if (value.length < 8) {
                      return "A senha é muito curta";
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 16.0),

                //BOTÃO ESQUECI MINHA SENHA
                MaterialButton(
                  onPressed: () => {},
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                      color: const Color.fromRGBO(20, 72, 132, 1),
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                //BOTÃO ENTRAR
                MaterialButton(
                  height: 41.0,
                  minWidth: 171.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  color: (Color(0xFFF9944A)),
                  //color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: new Text("Entrar"),
                  onPressed: () => {botaoEntrarClicado()},
                  //splashColor: Colors.redAccent,
                ),
                SizedBox(height: 2),

                //NOVO BOTÃO CADASTRAR-SE
                MaterialButton(
                  height: 41.0,
                  minWidth: 171.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  color: (Color(0xFFF9944A)),
                  //color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: new Text("Cadastrar-se"),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Registerpage()))
                  },
                  //splashColor: Colors.redAccent,
                ),
                SizedBox(height: 10),

                //botão google
                MaterialButton(
                  onPressed: () {
                    //lógica do botão aqui
                  },
                  height: 41.0,
                  minWidth: 171.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/Google_Login.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text('Entrar com o Google')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  botaoEntrarClicado() {
    if (_formKey.currentState!.validate()) {
      print("Form válido");
    } else {
      print("Form inválido");
    }
  }
}
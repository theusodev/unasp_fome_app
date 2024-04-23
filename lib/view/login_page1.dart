// ignore_for_file: prefer_const_constructors, camel_case_types, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unasp_fome_app/view/home_page.dart';
import 'package:unasp_fome_app/view/register_page.dart';

class newLoginPage extends StatefulWidget {
  const newLoginPage({super.key});

  @override
  _newLoginPageState createState() => _newLoginPageState();
}

class _newLoginPageState extends State<newLoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.all(16.0), //essa merda aqui é a distancia das bordas

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
            TextField(
              decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0))),
            ),
            SizedBox(height: 16.0),

            //CAMPO SENHA
            TextField(
              decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0))),
              obscureText: true,
            ),
            SizedBox(height: 16.0),

            //esqueci minha fucking senha
            Align(
              //alignment: Alignment.topCenter,
              child: MaterialButton(
                onPressed: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Positioned(
                                  right: -40,
                                  top: -40,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      //TEXTO DE INSTRUÇÃO
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          'Para redefinir sua senha, informe o e-mail cadastrado na sua conta e lhe enviaremos um link com as instruções.',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                      //CAMPO E-EMAIL
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'E-mail',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              100)))),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: ElevatedButton(
                                          child: const Text('Enviar'),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                },
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    color: const Color.fromRGBO(20, 72, 132, 1),
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
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
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Homepage())) //o problema tá por aqui
              },
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
    );
  }
}

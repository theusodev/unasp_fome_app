import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:unasp_fome_app/features/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Align(
              alignment: Alignment.topCenter, // Alinhe a imagem à parte superior central
              child: Image.asset(
                'assets/images/Logo_Login.png', // Substitua pelo caminho correto da sua imagem
                width: 250, // Largura da imagem
                height: 250, // Altura da imagem
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'E-mail',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.0))),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Senha',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.0))),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Adicione aqui a lógica para esquecer a senha
                  },
                  child: Text(
                    'Esqueci minha Senha',
                  style: TextStyle(
                    color: const Color.fromRGBO(20, 72, 132, 1),
                    decoration: TextDecoration.underline,
                    fontSize: 16
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
                  onPressed: () => {}, 
                  //splashColor: Colors.redAccent,
                )
              ],
            ),
            SizedBox(height: 0.0),
            
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
                  onPressed: () => {}, 
                  //splashColor: Colors.redAccent,
                ),
                SizedBox(height: 10.0),

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
                      Image.asset('assets/images/Google_Login.png',
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
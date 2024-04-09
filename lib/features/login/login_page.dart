import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
                ElevatedButton(
                  onPressed: () {
                    // Adicione aqui a lógica de autenticação
                    // Por exemplo, usando Firebase Authentication
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF9944A)),
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white))
                  ),
                  child: Text('Entrar',
                  style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            
            ElevatedButton(
              onPressed: () {
                // Navegue para a tela de registro
                // Por exemplo, Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF9944A)), // Define a cor do texto
                
              ),
              child: Text('Cadastre-se',
              style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 8.0),

            ElevatedButton.icon(
              onPressed: () {
                // Adicione aqui a lógica para o login com Google
              },
              icon: Image.asset('assets/images/Google_Login.png', width: 24, height: 24), // Ícone do Google
              label: Text('Entrar com o Google'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}
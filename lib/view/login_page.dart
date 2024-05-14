// ignore_for_file: prefer_const_constructors, camel_case_types, library_private_types_in_public_api, unnecessary_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unasp_fome_app/common/meu_snackbar.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';
import 'package:unasp_fome_app/view/home_page.dart';
import 'package:unasp_fome_app/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  AutenticacaoService _autentService = AutenticacaoService();

  // Função para validar a senha
  String? validatePassword(String value) {
    // Verifica se a senha tem pelo menos 8 caracteres
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    // Verifica se a senha contém letras maiúsculas
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'A senha deve conter pelo menos uma letra maiúscula';
    }
    // Verifica se a senha contém letras minúsculas
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'A senha deve conter pelo menos uma letra minúscula';
    }
    // Verifica se a senha contém números
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'A senha deve conter pelo menos um número';
    }
    // Verifica se a senha contém caracteres especiais
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'A senha deve conter pelo menos um caractere especial';
    }
    return null; // Senha válida
  }

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
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      errorStyle: TextStyle(fontSize: 18.0),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                  validator: (value) {
                      if(value!.isEmpty){
                        return"Insira um e-mail";
                      }

                      if(!value.contains("@")){
                        return 'Insira um e-mail válido';
                      }
                    },
                ),
                SizedBox(height: 16.0),

                //CAMPO SENHA
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      errorStyle: TextStyle(fontSize: 18.0),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                  validator: (value) => validatePassword(value!),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),

                //BOTÃO ESQUECI MINHA SENHA
                MaterialButton(
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                  ),
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
                  onPressed: () => {
                    botaoEntrarClicado()
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
                    SignInWithGoogle();
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

    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      print("Form válido");
      _autentService.logarUsuarios(email: email, senha: senha).then((String? erro){
        if (erro != null){
          mostrarSnackBar(context: context, texto: erro);
        }
      });
    } else {
      print("Form inválido");
    }
  }

   SignInWithGoogle() async {

    GoogleSignInAccount? googleUser=await GoogleSignIn(). signIn();

    GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/common/meu_snackbar.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';
import 'package:unasp_fome_app/providers/user_provider.dart';
import 'package:unasp_fome_app/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool queroEntrar = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();

  AutenticacaoService _autentService = AutenticacaoService();

  String? validatePassword(String value) {
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }

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
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/Logo_Login.png',
                    width: 250,
                    height: 250,
                  ),
                ),

                //campo de email
                TextFormField(
                  controller: _emailController,
                  decoration: inputDecoration('E-mail'),
                  // decoration: InputDecoration(
                  //     labelText: 'E-mail',
                  //     errorStyle: TextStyle(fontSize: 18.0),
                  //     errorBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(100.0),
                  //         borderSide: BorderSide(color: Colors.red, width: 2)),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(100.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira um e-mail";
                    }

                    if (!value.contains("@")) {
                      return 'Insira um e-mail válido';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.0),
                
                // campo de senha
                TextFormField(
                  controller: _senhaController,
                  decoration: inputDecoration('Senha'),
                  // decoration: InputDecoration(
                  //     labelText: 'Senha',
                  //     errorStyle: TextStyle(fontSize: 18.0),
                  //     errorBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(100.0),
                  //         borderSide: BorderSide(color: Colors.red, width: 2)),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(100.0))),
                  validator: (value) => validatePassword(value!),
                  obscureText: true,
                ),

                SizedBox(height: 16.0),

                //CAMPOS DE REGISTRO
                Visibility(
                  visible: !queroEntrar,
                  child: Column(
                    children: [

                      // campo de nome
                      TextFormField(
                        controller: _nomeController,
                        decoration: inputDecoration('Nome'),
                        validator:
                            RequiredValidator(errorText: 'Nome é obrigatório'),
                      ),

                      SizedBox(height: 16),
                      
                      // campo data de nascimento
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _nascimentoController,
                        decoration: inputDecoration('Data de Nascimento'),
                        validator: RequiredValidator(
                            errorText: 'Data de Nascimento é obrigatória'),
                      ),

                      SizedBox(height: 16),
                      
                      // campo de cpf
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _cpfController,
                        decoration: inputDecoration('CPF'),
                        validator:
                            RequiredValidator(errorText: 'CPF é obrigatório'),
                      ),
                      
                      SizedBox(height: 16),
                      
                      // campo de telefone
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _telefoneController,
                        decoration: inputDecoration('Telefone'),
                        validator: RequiredValidator(
                            errorText: 'Telefone é obrigatório'),
                      ),

                      SizedBox(height: 16),
                      
                      //campo de endereço
                      TextFormField(
                        controller: _enderecoController,
                        decoration: inputDecoration('Endereço'),
                        validator: RequiredValidator(
                            errorText: 'Endereço é obrigatório'),
                      ),

                      SizedBox(height: 16),
                      
                      // campo de cep
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _cepController,
                        decoration: inputDecoration('CEP'),
                        validator:
                            RequiredValidator(errorText: 'CEP é obrigatório'),
                      ),
                      SizedBox(height: 16),
                      
                      // campo de complemento
                      TextFormField(
                        controller: _complementoController,
                        decoration: inputDecoration('Complemento'),
                      ),
                      
                      SizedBox(height: 16),
                      
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        queroEntrar = !queroEntrar;
                      });
                    },
                    child: Text((queroEntrar)
                        ? "Não tem uma conta ainda? Cadastre-se já!"
                        : "Já tem uma conta? Entre já!")),
                SizedBox(height: 10.0),
                MaterialButton(
                  height: 41.0,
                  minWidth: 171.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  color: (Color(0xFFF9944A)),
                  textColor: Colors.white,
                  child: Text((queroEntrar) ? "Entrar" : "Registrar"),
                  onPressed: () => {botaoEntrarClicado()},
                ),
                SizedBox(height: 2),
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
    if (queroEntrar) {
      loginUsuario();
    } else {
      registrarUsuario();
    }
  }

  void loginUsuario() {
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      print("Formulário de login válido");
      _autentService
          .logarUsuarios(email: email, senha: senha)
          .then((String? erro) {
        if (!mounted) return; // Verifica se o widget ainda está montado
        if (erro != null) {
          mostrarSnackBar(context: context, texto: erro);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        }
      });
    } else {
      print("Formulário de login inválido");
    }
  }

  void registrarUsuario() async {
    if (_formKey.currentState!.validate()) {
      String nome = _nomeController.text;
      String nascimento = _nascimentoController.text;
      String cpf = _cpfController.text;
      String email = _emailController.text;
      String senha = _senhaController.text;
      String telefone = _telefoneController.text;
      String endereco = _enderecoController.text;
      String complemento = _complementoController.text;
      String cep = _cepController.text;

      String? errorMessage = await _autentService.cadastrarUsuario(
        nome: nome,
        nascimento: nascimento,
        cpf: cpf,
        email: email,
        senha: senha,
        telefone: telefone,
        endereco: endereco,
        complemento: complemento,
        cep: cep,
      );

      if (!mounted) return; // Verifica se o widget ainda está montado
      if (errorMessage == null) {
        Provider.of<UserProvider>(context, listen: false).setUserData({
          'nome': nome,
          'nascimento': nascimento,
          'cpf': cpf,
          'email': email,
          'telefone': telefone,
          'endereco': endereco,
          'complemento': complemento,
          'cep': cep,
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        mostrarSnackBar(context: context, texto: errorMessage);
      }
    }
  }

  Future<UserCredential?> SignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // O usuário cancelou a autenticação
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Erro ao fazer login com o Google: $e');
      return null;
    }
  }
}

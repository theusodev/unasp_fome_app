import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/common/meu_snackbar.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';
import 'package:unasp_fome_app/providers/user_provider.dart';
import 'package:unasp_fome_app/view/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool queroLogar = true;

  final Map<String, String> userData = {};
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for user input
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();

  final AutenticacaoService _autenticacaoService = AutenticacaoService();

  // Password validation function
  String? validatePassword(String value) {
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }

  // Custom input decoration
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
      appBar: AppBar(
        title: Text('Tela de Registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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

                //EMAIL
                TextFormField(
                  controller: _emailController,
                  decoration: inputDecoration('E-mail'),
                  validator: EmailValidator(errorText: 'E-mail inválido'),
                ),
                SizedBox(
                  height: 16,
                ),

                //SENHA
                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: inputDecoration('Senha'),
                  //validator: validatePassword,
                ),
                SizedBox(
                  height: 16,
                ),

                
                Visibility(visible: !queroLogar,
                child: Column(
                  children: [
                  //NOME
                TextFormField(
                  controller: _nomeController,
                  decoration: inputDecoration('Nome'),
                  validator: RequiredValidator(errorText: 'Nome é obrigatório'),
                ),

                SizedBox(
                  height: 16,
                ),

                //DATA DE NASCIMENTO
                TextFormField(
                  controller: _nascimentoController,
                  decoration: inputDecoration('Data de Nascimento'),
                  validator: RequiredValidator(
                      errorText: 'Data de Nascimento é obrigatória'),
                ),

                SizedBox(
                  height: 16,
                ),

                //CPF
                TextFormField(
                  controller: _cpfController,
                  decoration: inputDecoration('CPF'),
                  validator: RequiredValidator(errorText: 'CPF é obrigatório'),
                ),
                SizedBox(
                  height: 16,
                ),

                //telefone
                TextFormField(
                  controller: _telefoneController,
                  decoration: inputDecoration('Telefone'),
                  validator:
                      RequiredValidator(errorText: 'Telefone é obrigatório'),
                ),
                SizedBox(
                  height: 16,
                ),


                    //ENDEREÇO
                TextFormField(
                  controller: _enderecoController,
                  decoration: inputDecoration('Endereço'),
                  validator:
                      RequiredValidator(errorText: 'Endereço é obrigatório'),
                ),
                SizedBox(
                  height: 16,
                ),

                //COMPLEMENTO
                TextFormField(
                  controller: _complementoController,
                  decoration: inputDecoration('Complemento'),
                ),
                SizedBox(
                  height: 16,
                ),

                //CEP
                TextFormField(
                  controller: _cepController,
                  decoration: inputDecoration('CEP'),
                  validator: RequiredValidator(errorText: 'CEP é obrigatório'),
                ),
                SizedBox(
                  height: 16,
                ),

                  ],
                ),),

                

                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        userData['nome'] = _nomeController.text;
                        userData['nascimento'] = _nascimentoController.text;
                        userData['cpf'] = _cpfController.text;
                        userData['email'] = _emailController.text;
                        userData['senha'] = _senhaController.text;
                        userData['telefone'] = _telefoneController.text;
                        userData['endereco'] = _enderecoController.text;
                        userData['complemento'] = _complementoController.text;
                        userData['cep'] = _cepController.text;

                        //essa parte do codigo envia os dados para a autenticação service
                        //então no caso está recebendo email e senha, apenas
                        //
                        String? errorMessage =
                            await _autenticacaoService.cadastrarUsuario(
                          nome: userData['nome']!,
                          nascimento: userData['nascimento']!,
                          cpf: userData['cpf']!,
                          email: userData['email']!,
                          senha: userData['senha']!,
                          telefone: userData['telefone']!,
                          endereco: userData['endereco']!,
                          complemento: userData['complemento']!,
                          cep: userData['cep']!,
                        );

                        if (errorMessage == null) {
                          //essa parte do provider envia os dados de registro para a tela de perfil
                          Provider.of<UserProvider>(context, listen: false)
                              .setUserData(userData);

                          //caso não tenha erro no if lá de cima tudo isso será executado e vai para a tela de home
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homepage(),
                            ),
                          );
                        } else {
                          mostrarSnackBar(
                              context: context,
                              texto: errorMessage,
                              isErro: true);
                        }
                      }
                    },
                    child: Text(
                      (queroLogar) ? 'Entrar' : 'Registrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  height: 16,
                ),
                
                Center(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            queroLogar = !queroLogar;
                          });
                        },
                        child: Text((queroLogar)
                            ? "Não tem uma conta ainda? Cadastre-se já!"
                            : "Já tem uma conta? Entre já!")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, implicit_call_tearoffs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:unasp_fome_app/common/meu_snackbar.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';
import 'package:unasp_fome_app/view/home_page.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  Map userData = {};
  bool queroCadastrar = true;
  final _formKey = GlobalKey<FormState>();
  bool passenable = true;

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _nascimentoController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _complementoController = TextEditingController();
  TextEditingController _cepController = TextEditingController();

  AutenticacaoService _autentService = AutenticacaoService();

  // Função para validar a senha
  String? validatePassword(String value) {
    // Verifica se a senha tem pelo menos 8 caracteres
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    // // Verifica se a senha contém letras maiúsculas
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'A senha deve conter pelo menos uma letra maiúscula';
    // }
    // // Verifica se a senha contém letras minúsculas
    // if (!value.contains(RegExp(r'[a-z]'))) {
    //   return 'A senha deve conter pelo menos uma letra minúscula';
    // }
    // // Verifica se a senha contém números
    // if (!value.contains(RegExp(r'[0-9]'))) {
    //   return 'A senha deve conter pelo menos um número';
    // }
    // // Verifica se a senha contém caracteres especiais
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return 'A senha deve conter pelo menos um caractere especial';
    // }
    return null; // Senha válida
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //aqui é a tela de registro
      appBar: AppBar(
        title: Text('Tela de Registro'),
      ),
      
      //aqui começa toda a estrutura da tela de registro, os formularios e tudo mais
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/Logo_Login.png'),
                    ),
                  ),
                ),

                // //CAMPO DO NOME
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: TextFormField(
                //     controller: _nomeController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Insira o nome';
                //       }
                //       // Verifica se contém apenas letras e espaços
                //       if (!RegExp(r'^[a-zA-ZÀ-ÿ\s]+$').hasMatch(value)) {
                //         return 'Insira um nome válido';
                //       }
                //       // Verifica se tem pelo menos 3 caracteres
                //       if (value.length < 3) {
                //         return 'Insira no mínimo 3 caracteres';
                //       }
                //       return null; // Nome válido
                //     },
                //     decoration: InputDecoration(
                //         //hintText: 'Insira seu nome completo',
                //         labelText: 'Nome Completo',
                //         errorStyle: TextStyle(fontSize: 18.0),
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.red),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(100.0)))),
                //   ),
                // ),

                // //CAMPO DATA DE NASCIMENTO
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: TextFormField(
                //     controller: _nascimentoController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Insira sua data de nascimento';
                //       }
                //       // Verifica se a data está no formato correto (DD/MM/AAAA)
                //       RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                //       if (!dateRegex.hasMatch(value)) {
                //         return 'Insira uma data válida (DD/MM/AAAA)';
                //       }
                //       // Verifica se é uma data válida no calendário
                //       List<String> parts = value.split('/');
                //       int day = int.tryParse(parts[0]) ?? 0;
                //       int month = int.tryParse(parts[1]) ?? 0;
                //       int year = int.tryParse(parts[2]) ?? 0;
                //       if (day < 1 ||
                //           day > 31 ||
                //           month < 1 ||
                //           month > 12 ||
                //           year < 1900) {
                //         return 'Insira uma data válida';
                //       }
                //       // Verifica se o mês tem o número correto de dias
                //       if (day > 28 && month == 2) {
                //         if ((year % 4 == 0 && year % 100 != 0) ||
                //             (year % 400 == 0)) {
                //           if (day > 29) {
                //             return 'Insira uma data válida';
                //           }
                //         } else if (day > 28) {
                //           return 'Insira uma data válida';
                //         }
                //       } else if ((day > 30 &&
                //           (month == 4 ||
                //               month == 6 ||
                //               month == 9 ||
                //               month == 11))) {
                //         return 'Insira uma data válida';
                //       }
                //       return null; // Data válida
                //     },
                //     decoration: InputDecoration(
                //         labelText: 'Data de Nascimento',
                //         errorStyle: TextStyle(fontSize: 18.0),
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.red),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(100.0)))),
                //   ),
                // ),

                // //CAMPO DO CPF
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: TextFormField(
                //     controller: _cpfController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Insira um CPF';
                //       }
                //       String cpf = value.replaceAll(RegExp(r'[^\d]'),
                //           ''); // Remove todos os caracteres que não são dígitos
                //       if (cpf.length != 11) {
                //         return 'Insira um CPF válido';
                //       }
                //       // Verifica os dígitos verificadores
                //       int soma = 0;
                //       for (int i = 0; i < 9; i++) {
                //         soma += int.parse(cpf[i]) * (10 - i);
                //       }
                //       int resto = soma % 11;
                //       if (resto < 2) {
                //         if (int.parse(cpf[9]) != 0) {
                //           return 'Insira um CPF válido';
                //         }
                //       } else {
                //         if (int.parse(cpf[9]) != 11 - resto) {
                //           return 'Insira um CPF válido';
                //         }
                //       }
                //       soma = 0;
                //       for (int i = 0; i < 10; i++) {
                //         soma += int.parse(cpf[i]) * (11 - i);
                //       }
                //       resto = soma % 11;
                //       if (resto < 2) {
                //         if (int.parse(cpf[10]) != 0) {
                //           return 'Insira um CPF válido';
                //         }
                //       } else {
                //         if (int.parse(cpf[10]) != 11 - resto) {
                //           return 'Insira um CPF válido';
                //         }
                //       }
                //       return null; // CPF válido
                //     },
                //     decoration: InputDecoration(
                //         labelText: 'CPF',
                //         errorStyle: TextStyle(fontSize: 18.0),
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.red),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(100)))),
                //   ),
                // ),

                //CAMPO EMAIL
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return"Insira um e-mail";
                      }

                      if(!value.contains("@")){
                        return 'Insira um e-mail válido';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'E-mail',
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)))),
                  ),
                ),

                //CAMPO SENHA
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _senhaController,
                    obscureText: passenable,
                    validator: (value) => validatePassword(
                        value!), // Usando o validador personalizado
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(fontSize: 18.0),
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        )),
                  ),
                ),

                // //CAMPO DO TELEFONE
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: TextFormField(
                //     controller: _telefoneController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Insira um telefone válido';
                //       }
                //       // Remove todos os caracteres que não são dígitos
                //       String phone = value.replaceAll(RegExp(r'[^\d]'), '');
                //       // Verifica se o telefone tem 11 dígitos
                //       if (phone.length != 11) {
                //         return 'Insira um telefone válido';
                //       }
                //       return null; // Telefone válido
                //     },
                //     decoration: InputDecoration(
                //         labelText: 'Telefone',
                //         errorStyle: TextStyle(fontSize: 18.0),
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.red),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(100)))),
                //   ),
                // ),

                // //CAMPO DO ENDEREÇO
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: TextFormField(
                //     controller: _enderecoController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Insira seu endereço';
                //       }
                //       return null; // Endereço válido
                //     },
                //     decoration: InputDecoration(
                //         //hintText: 'Insira seu nome completo',
                //         labelText: 'Endereço',
                //         errorStyle: TextStyle(fontSize: 18.0),
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.red),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(100.0)))),
                //   ),
                // ),

                // //CAMPO DO COMPLEMENTO
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: TextFormField(
                //     controller: _complementoController,
                //     validator: (value) {
                //       // Se o campo de complemento estiver preenchido, não há problema
                //       if (value != null && value.isNotEmpty) {
                //         return null; // Complemento válido
                //       }
                //       // Se estiver vazio, não exibe uma mensagem de erro
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //         //hintText: 'Insira seu nome completo',
                //         labelText: 'Complemento',
                //         errorStyle: TextStyle(fontSize: 18.0),
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.red),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(100.0)))),
                //   ),
                // ),

                // //CAMPO DO CEP
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: TextFormField(
                //     controller: _cepController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Insira seu CEP';
                //       }
                //       // Remove todos os caracteres que não são dígitos
                //       String cep = value.replaceAll(RegExp(r'[^\d]'), '');
                //       // Verifica se o CEP tem 8 dígitos
                //       if (cep.length != 8) {
                //         return 'Insira um CEP válido';
                //       }
                //       return null; // CEP válido
                //     },
                //     decoration: InputDecoration(
                //         labelText: 'CEP',
                //         errorStyle: TextStyle(fontSize: 18.0),
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.red),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(100)))),
                //   ),
                // ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: MaterialButton(
                        height: 41.0,
                        minWidth: 171.0,
                        onPressed: () {
                          botaoRegistrarClicado();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color(0xFFF9944A),
                        child: Text(
                          'Registrar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  botaoRegistrarClicado() {
    String nome = _nomeController.text;
    String nascimento = _nascimentoController.text;
    String cpf = _cpfController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;
    String telefone = _telefoneController.text;
    String endereco = _enderecoController.text;
    String complemento = _complementoController.text;
    String cep = _cepController.text;

    if (_formKey.currentState!.validate()) {
      if (queroCadastrar) {
        print("Entrada validada");
        print(
            "${_nomeController.text}, ${_nascimentoController.text}, ${_cpfController.text}, ${_emailController.text}, ${_senhaController.text}, ${_telefoneController.text}, ${_enderecoController.text}, ${_complementoController.text}, ${_cepController.text}");
        _autentService
            .cadastrarUsuario(
                nome: nome,
                nascimento: nascimento,
                cpf: cpf,
                email: email,
                senha: senha,
                telefone: telefone,
                endereco: endereco,
                complemento: complemento,
                cep: cep)
            .then(
          (String? erro) {
            //deu erro
            if (erro != null) {
              mostrarSnackBar(context: context, texto: erro);
            }
          },
        );
      }
    } else {
      print("Form inválido");
    }
  }
}

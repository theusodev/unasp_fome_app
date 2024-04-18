// ignore_for_file: prefer_const_constructors, implicit_call_tearoffs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {

  bool passenable = true;

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
            // key: _formkey,
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
                
                //CAMPO DO NOME
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Insira o nome'),
                      MinLengthValidator(3, 
                      errorText: 'Insira no mínimo 3 caracteres')
                    ]),
                    decoration: InputDecoration(
                      //hintText: 'Insira seu nome completo',
                      labelText: 'Nome Completo',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                      borderRadius: 
                        BorderRadius.all(Radius.circular(100.0)))
                      ),
                  ),
                ),

                //CAMPO DATA DE NASCIMENTO
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Insira sua data de nascimento'),
                      DateValidator(('dd/mm/yyyy'), 
                      errorText: 'Insira uma data válida')
                    ]),
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(100.0))
                      )
                    ),
                  ),
                ),

                //CAMPO DO CPF
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Insira um CPF'),
                      PatternValidator(r'(^[0,9]{11}$)', 
                      errorText: 'Insira um CPF válido')
                    ]),
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: 
                          BorderRadius.all(Radius.circular(100))
                      )
                    ),
                  ),
                ),

                //CAMPO EMAIL
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Insira seu E-mail'),
                      EmailValidator(errorText: 'Insira um E-mail válido')
                    ]),
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(100))
                      )
                    ),
                  ),
                ),

                //CAMPO SENHA
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    obscureText: passenable,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(fontSize: 18.0),
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      )
                    ),
                  ),
                ),

                //CAMPO DO TELEFONE
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Insira um telefone válido'),
                      PatternValidator(r'(^[0,9]{11}$)', 
                      errorText: 'Insira um telefone válido')
                    ]),
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: 
                          BorderRadius.all(Radius.circular(100))
                      )
                    ),
                  ),
                ),

                //CAMPO DO ENDEREÇO
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Insira seu endereço'),
                      MinLengthValidator(0, 
                      errorText: 'Insira seu endereço')
                    ]),
                    decoration: InputDecoration(
                      //hintText: 'Insira seu nome completo',
                      labelText: 'Endereço',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                      borderRadius: 
                        BorderRadius.all(Radius.circular(100.0)))
                      ),
                  ),
                ),

                //CAMPO DO COMPLEMENTO
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Insira o complemento'),
                      MinLengthValidator(0, 
                      errorText: 'Insira o complemento')
                    ]),
                    decoration: InputDecoration(
                      //hintText: 'Insira seu nome completo',
                      labelText: 'Complemento',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                      borderRadius: 
                        BorderRadius.all(Radius.circular(100.0)))
                      ),
                  ),
                ),

                //CAMPO DO CEP
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Insira seu CEP'),
                      PatternValidator(r'(^[0,9]{8}$)', 
                      errorText: 'Insira seu CEP')
                    ]),
                    decoration: InputDecoration(
                      labelText: 'CEP',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: 
                          BorderRadius.all(Radius.circular(100))
                      )
                    ),
                  ),
                ),
                
              ],
            ),
          )),
      ),
    );
  }
}
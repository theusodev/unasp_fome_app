import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Center(
          child: ElevatedButton(
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
                                    child: Text('Para redefinir sua senha, informe o e-mail cadastrado na sua conta e lhe enviaremos um link com as instruções.',
                                    textAlign: TextAlign.center,),
                                  ),
                                  
                                  //CAMPO E-EMAIL
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'E-mail',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(100))
                                        )
                                      ),
                                    ),
                                  ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      child: const Text('Enviar'),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
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
            child: const Text('Esqueci minha senha'),
          ),
        ),
    );
  }
}
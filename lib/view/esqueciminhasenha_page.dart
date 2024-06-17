import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EsqueciminhasenhaPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  EsqueciminhasenhaPage({super.key});

  void _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
      _showAlertDialog(context, 'Sucesso', 'E-mail de recuperação enviado com sucesso. Verifique sua caixa de entrada.');
    } catch (e) {
      _showAlertDialog(context, 'Erro', 'Falha ao enviar o e-mail de recuperação. Verifique o e-mail e tente novamente.');
    }
  }

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Esqueci minha senha',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "Insira seu e-mail e verifique a caixa de entrada para restaurar sua senha.",
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              decoration: inputDecoration("E-mail"),
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _resetPassword(context),
              child: Text(
                "Restaurar senha",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}

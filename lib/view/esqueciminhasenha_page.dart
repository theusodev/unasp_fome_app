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
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
    } catch (e) {
      print("Error: $e");
    }
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

            ElevatedButton(onPressed: () => _resetPassword(context), 
            child: Text("Reenviar senha",
            style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
            ),

          ],
        ),),
    );
  }
}
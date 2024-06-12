import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/model/payment_model.dart';
import 'package:unasp_fome_app/providers/user_provider.dart';
import 'package:unasp_fome_app/providers/user_provider.dart'; // Importe o UserProvider
import 'package:unasp_fome_app/view/home_page.dart';
import 'package:unasp_fome_app/view/login_page.dart';
import 'package:unasp_fome_app/view/register_page.dart';
import 'package:unasp_fome_app/view/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  //arquivo principal do app
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => PaymentModel()),
        ChangeNotifierProvider(create: (context) => UserProvider()), // Adicione o UserProvider aqui
      ],
      child: const MaterialApp(
        home: RoteadorTela(),
      ),
    );
  }
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Homepage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}

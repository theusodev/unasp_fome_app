import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unasp_fome_app/view/home_page.dart';
import 'package:unasp_fome_app/view/login_page.dart';
import 'package:unasp_fome_app/view/login_page.dart';
import 'package:unasp_fome_app/view/navigationpagebar_page.dart';
import 'package:unasp_fome_app/view/register_page.dart';
import 'package:unasp_fome_app/view/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RoteadorTela(),
    );
  }
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(stream: FirebaseAuth.instance.userChanges(), builder: (context, snapshot){
      if (snapshot.hasData){
        return const Homepage();
      }else{
        return const LoginPage();
      }
    });
  }
}
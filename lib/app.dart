import 'package:flutter/material.dart';
import 'package:unasp_fome_app/features/login/login_page.dart';
import 'package:unasp_fome_app/features/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
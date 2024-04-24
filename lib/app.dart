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
      home: Registerpage(),
    );
  }
}
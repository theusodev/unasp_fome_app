import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unasp_fome_app/services/autenticacao_service.dart';
import 'package:unasp_fome_app/view/NewPageScreen.dart';
import 'package:unasp_fome_app/view/cart_page.dart';
import 'package:unasp_fome_app/view/profile_page.dart';
import 'package:unasp_fome_app/view/search_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    NewPageScreen("Home"),
    NewPageScreen("Procurar"),
    NewPageScreen("Carrinho"),
    NewPageScreen("Perfil")
  ];

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UnaspFome")),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(leading: Icon(Icons.logout), title: Text("Deslogar"), onTap: () {
            AutenticacaoService().deslogar();
            GoogleSignIn().signOut();
          },)
        ],),
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        backgroundColor: Color(0xFFCECECE),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_icon_Outlined.png',
              width: 24,
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/search_icon_Outlined.png',
                width: 24, height: 24),
            label: "Procurar",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/kart_icon_Outlined.png',
                width: 24, height: 24),
            label: "Carrinho",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profile_icon_Outlined.png',
                width: 24, height: 24),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}

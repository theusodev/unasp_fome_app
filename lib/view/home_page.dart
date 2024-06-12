import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/view/cart_page.dart';
import 'package:unasp_fome_app/view/initial_page.dart';
import 'package:unasp_fome_app/view/profile_page.dart';
import 'package:unasp_fome_app/view/search_page.dart';
import 'package:unasp_fome_app/providers/user_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // view responsavel pela barra navegação inferior
      body: PageView(
        controller: pc,
        children: [
          InitialPage(),
          SearchPage(),
          CartPage(),
          ProfilePage(), // Não é mais necessário passar userData aqui
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFCECECE),

        currentIndex: paginaAtual,
        items: [
          //botao home
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "Home",
            activeIcon: Icon(Icons.home, color: Colors.orange),
          ),
          
          //botao procurar
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: "Procurar",
            activeIcon: Icon(Icons.search, color: Colors.orange),
          ),
          
          //botao carrinho
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: "Carrinho",
            activeIcon: Icon(Icons.shopping_cart, color: Colors.orange),
          ),
          
          //botao perfil
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.black),
            label: "Perfil",
            activeIcon: Icon(Icons.account_circle, color: Colors.orange),
          ),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina, duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}

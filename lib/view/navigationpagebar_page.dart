import 'package:flutter/material.dart';

class Navigationpagebar extends StatelessWidget {
  const Navigationpagebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        backgroundColor: Color.fromARGB(255, 206, 206, 206),
        onTap: (value) {
          //função aqui
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/home_icon_Outlined.png',
              width: 24,
              height: 24),
              label: 'Home',
              //activeIcon: Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()))
          ),

          BottomNavigationBarItem(
              icon: Image.asset('assets/images/search_icon_Outlined.png',
              width: 24,
              height: 24),
              label: 'Procurar',
          ),

          BottomNavigationBarItem(
              icon: Image.asset('assets/images/kart_icon_Outlined.png',
              width: 24,
              height: 24),
              label: 'Carrinho',
          ),

          BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile_icon_Outlined.png', 
              width:24, 
              height:24),
              label: 'Perfil',
          ),
        ],
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
    ); 
  }
}
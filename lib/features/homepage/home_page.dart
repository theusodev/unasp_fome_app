import 'package:flutter/material.dart';
import 'package:unasp_fome_app/app.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        backgroundColor: Color.fromARGB(255, 255, 216, 166),
        fixedColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Home',
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Procurar',
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.flip),
              label: 'Carrinho',
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Perfil',
          ),
        ],
        
      ),
    ); 
  }
}
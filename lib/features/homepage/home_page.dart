import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unasp_fome_app/app.dart';
import 'package:unasp_fome_app/common/constants/app_colors.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        unselectedLabelStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
        backgroundColor: AppColors.navigationbar_background,
        fixedColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color(0xFF000000),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/home_icon_Outlined.png',
              width: 24,
              height: 24),
              label: 'Home',
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
    ); 
  }
}
import 'package:flutter/material.dart';
import 'package:unasp_fome_app/common/constants/app_colors.dart';

class Navigationpagebar extends StatelessWidget {
  const Navigationpagebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        backgroundColor: AppColors.navigationbar_background,
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
    );
  }
}
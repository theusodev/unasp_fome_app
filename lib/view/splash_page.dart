import 'package:flutter/material.dart';
import 'package:unasp_fome_app/common/constants/app_colors.dart';
import 'package:unasp_fome_app/view/login_page1.dart';

import 'login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () {
      // Após o tempo definido, navegue para a HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => newLoginPage()),
      );
    });

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whitebackground,
      ),
      child: Image.asset(
        'assets/images/Icone Unasp Fome.png',
        width: 360,
        height: 316,
        alignment: Alignment(0, -0.174),
      ),
    );
  }
}

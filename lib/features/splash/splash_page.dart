import 'package:flutter/material.dart';
import 'package:unasp_fome_app/common/constants/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whitebackground,
      ),
      child: Image.asset('assets/images/Icone Unasp Fome.png', 
      width: 360, 
      height: 316,
      alignment: Alignment(0, -0.174),),
    );
  }
}
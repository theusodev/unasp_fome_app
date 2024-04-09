import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset('assets/images/Icone Unasp Fome.png', 
      width: 360, 
      height: 316,
      alignment: Alignment(0, -0.174),),
    );
  }
}
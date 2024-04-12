import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFFFFFFFF),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFF2196F3),
            ),
          )
        ],
      ),
    );
  }
}
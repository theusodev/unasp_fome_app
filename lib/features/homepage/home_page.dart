import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: const [
            Text('primeiro'),
            Text('segundo'),
            Text('terceiro'),
            Text('quarto'),
          ],
        ),
      );
    }
}
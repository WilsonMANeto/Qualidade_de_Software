import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AppReceitas());
}

class AppReceitas extends StatelessWidget {
  const AppReceitas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Receitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(), 
    );
  }
}
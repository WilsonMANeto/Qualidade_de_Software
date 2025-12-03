import 'package:flutter/material.dart';

// --- BLOCO 1 ---
class WidgetComplexo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 5),
        ],
      ),
      child: Column(
        children: [
          Text("Este é um texto muito longo para testar"),
          Icon(Icons.star, size: 50, color: Colors.yellow),
          ElevatedButton(onPressed: () {}, child: Text("Clique Aqui")),
        ],
      ),
    );
  }
}

// --- BLOCO 2 (Cópia Exata) ---
class WidgetComplexo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 5),
        ],
      ),
      child: Column(
        children: [
          Text("Este é um texto muito longo para testar"),
          Icon(Icons.star, size: 50, color: Colors.yellow),
          ElevatedButton(onPressed: () {}, child: Text("Clique Aqui")),
        ],
      ),
    );
  }
}

// --- BLOCO 3 (Cópia Exata) ---
class WidgetComplexo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 5),
        ],
      ),
      child: Column(
        children: [
          Text("Este é um texto muito longo para testar"),
          Icon(Icons.star, size: 50, color: Colors.yellow),
          ElevatedButton(onPressed: () {}, child: Text("Clique Aqui")),
        ],
      ),
    );
  }
}
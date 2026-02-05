import 'package:flutter/material.dart';

class ReceitaCard extends StatelessWidget {
  final String titulo;

  const ReceitaCard({
    super.key,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.restaurant),
            const SizedBox(width: 10),
            Text(titulo),
          ],
        ),
      ),
    );
  }
}

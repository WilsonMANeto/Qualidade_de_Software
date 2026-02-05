import 'package:flutter/material.dart';

class ReceitaDetailScreen extends StatefulWidget {
  const ReceitaDetailScreen({super.key});

  @override
  State<ReceitaDetailScreen> createState() => _ReceitaDetailScreenState();
}

class _ReceitaDetailScreenState extends State<ReceitaDetailScreen> {
  bool _favorito = false;

  bool _checkIfFavorito() {
    return _favorito;
  }

  void _toggleFavorito() {
    setState(() {
      _favorito = !_favorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Receita'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Receita Exemplo'),
            const SizedBox(height: 20),
            IconButton(
              icon: Icon(
                _checkIfFavorito() ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: _toggleFavorito,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  final List<String> _favoritos = [];

  @override
  void initState() {
    super.initState();
    _carregarFavoritos();
  }

  void _carregarFavoritos() {
    // Simulação de carregamento
    setState(() {
      _favoritos.add('Lasanha');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: _favoritos.isEmpty
          ? const Center(
              child: Text('Nenhuma receita favoritada'),
            )
          : ListView.builder(
              itemCount: _favoritos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_favoritos[index]),
                );
              },
            ),
    );
  }
}

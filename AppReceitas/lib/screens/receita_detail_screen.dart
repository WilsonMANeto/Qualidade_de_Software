// Arquivo: lib/screens/receita_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/receita.dart';

class ReceitaDetailScreen extends StatefulWidget {
  final Receita receita;

  const ReceitaDetailScreen({Key? key, required this.receita})
      : super(key: key);

  @override
  _ReceitaDetailScreenState createState() => _ReceitaDetailScreenState();
}

class _ReceitaDetailScreenState extends State<ReceitaDetailScreen> {
  bool _isFavorito = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorito();
  }

  _checkIfFavorito() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoritos = prefs.getStringList('favoritos') ?? [];
    setState(() {
      _isFavorito = favoritos.contains(widget.receita.nome);
    });
  }

  _toggleFavorito() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoritos = prefs.getStringList('favoritos') ?? [];

    setState(() {
      if (_isFavorito) {
        favoritos.remove(widget.receita.nome);
      } else {
        favoritos.add(widget.receita.nome);
      }
      _isFavorito = !_isFavorito;
    });

    await prefs.setStringList('favoritos', favoritos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receita.nome),

        // AQUI ESTÁ O CORAÇÃO! <---
        // A propriedade 'actions' da AppBar adiciona widgets à direita do título.
        actions: [
          IconButton(
            icon: Icon(
              // Lógica para mostrar o coração preenchido ou apenas a borda
              _isFavorito ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            // Função que é chamada ao tocar no ícone
            onPressed: _toggleFavorito,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.receita.imagem,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.receita.nome,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.timer),
                      const SizedBox(width: 4),
                      Text(widget.receita.tempoPreparo),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Descrição:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.receita.descricao,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

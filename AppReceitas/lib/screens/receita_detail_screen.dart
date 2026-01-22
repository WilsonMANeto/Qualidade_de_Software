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

  static const double imageHeight = 250.0;
  static const double pagePadding = 16.0;
  static const double titleFontSize = 24.0;
  static const double sectionTitleFontSize = 18.0;
  static const double bodyFontSize = 16.0;
  static const double smallSpacing = 4.0;
  static const double mediumSpacing = 8.0;
  static const double largeSpacing = 16.0;

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
        actions: [
          IconButton(
            icon: Icon(
              _isFavorito ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
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
              height: imageHeight, // Constante usada
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(pagePadding), // Constante usada
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.receita.nome,
                    style: const TextStyle(
                        fontSize: titleFontSize, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: mediumSpacing),
                  Row(
                    children: [
                      const Icon(Icons.timer),
                      const SizedBox(width: smallSpacing),
                      Text(widget.receita.tempoPreparo),
                    ],
                  ),
                  const SizedBox(height: largeSpacing),
                  const Text(
                    'Descrição:',
                    style: TextStyle(
                        fontSize: sectionTitleFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: mediumSpacing),
                  Text(
                    widget.receita.descricao,
                    style: const TextStyle(fontSize: bodyFontSize),
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

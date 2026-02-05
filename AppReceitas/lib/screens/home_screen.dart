// Arquivo: lib/screens/home_screen.dart

import 'package:flutter/material.dart';

import '../models/receita.dart';
import '../widgets/receita_card.dart';
import 'favoritos_screen.dart';
import 'sobre_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Receita> receitas = [
    Receita(
      nome: 'Lasanha Bolonhesa',
      imagem: 'assets/lasanha.jpg',
      tempoPreparo: '45 min',
      descricao:
          'Uma lasanha deliciosa com carne moída, molho vermelho e queijo.',
    ),
    Receita(
      nome: 'Bolo de Chocolate',
      imagem: 'assets/bolo.jpg',
      tempoPreparo: '60 min',
      descricao: 'Bolo fofo e molhadinho com cobertura de brigadeiro.',
    ),
    Receita(
      nome: 'Filé de Frango Grelhado',
      imagem: 'assets/file.jpg',
      tempoPreparo: '30 min',
      descricao: 'Filé de frango temperado e grelhado, simples e saudável.',
    ),
  ];

  late final List<Widget> _telas;

  @override
  void initState() {
    super.initState();
    _telas = [
      ReceitasListWidget(receitas: receitas),
      FavoritosScreen(todasAsReceitas: receitas),
      const SobreScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Receitas'),
        centerTitle: true,
      ),
      body: _telas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
      ),
    );
  }
}

class ReceitasListWidget extends StatelessWidget {
  final List<Receita> receitas;

  static const double listPadding = 12.0;

  const ReceitasListWidget({
    super.key,
    required this.receitas,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(listPadding),
      itemCount: receitas.length,
      itemBuilder: _buildReceitaItem,
    );
  }

  /// Callback extraído para atender a regra
  /// prefer-extracting-callbacks (dart_code_metrics)
  Widget _buildReceitaItem(BuildContext context, int index) {
    return ReceitaCard(receita: receitas[index]);
  }
}

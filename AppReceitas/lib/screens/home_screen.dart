// Arquivo: lib/screens/home_screen.dart

/*import 'package:flutter/material.dart';

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
  // 1. Variável de ESTADO para controlar qual aba está ativa.
  int _selectedIndex = 0;

  // Sua lista de receitas original.
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
    )
  ];

  // Lista de Widgets (telas) que serão exibidas.
  late final List<Widget> _telas;

  @override
  void initState() {
    super.initState();
    _telas = [
      // Tela 0: A sua lista de receitas principal.
      _buildReceitasListView(),

      // Tela 1: A tela de favoritos, agora recebendo a lista de TODAS as receitas.
      // Isso é crucial para que ela possa filtrar e mostrar as corretas.
      FavoritosScreen(todasAsReceitas: receitas),

      // Tela 2: A tela "Sobre".
      SobreScreen(),
    ];
  }

  // Widget separado para a lista, para manter o código organizado.
  Widget _buildReceitasListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: receitas.length,
      itemBuilder: (context, index) => ReceitaCard(receita: receitas[index]),
    );
  }

  // 2. Função que atualiza o estado quando uma aba é tocada.
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
      // 3. O corpo da tela agora muda dinamicamente.
      body: _telas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 4. A barra de navegação reflete o estado atual.
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritas'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre'),
        ],
      ),
    );
  }
}
*/

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
  // 1. Variável de ESTADO para controlar qual aba está ativa.
  int _selectedIndex = 0;

  // Sua lista de receitas original.
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
    )
  ];

  // Lista de Widgets (telas) que serão exibidas.
  late final List<Widget> _telas;

  @override
  void initState() {
    super.initState();
    _telas = [
      // Tela 0: A sua lista de receitas principal.
      _buildReceitasListView(),

      // Tela 1: A tela de favoritos.
      FavoritosScreen(todasAsReceitas: receitas),

      // Tela 2: A tela "Sobre".
      SobreScreen(),
    ];
  }

  // Widget separado para a lista, para manter o código organizado.
  Widget _buildReceitasListView() {
    return Column(
      children: [
        // 🚨 Código propositalmente DEPRECIADO (para testar o pipeline)
        FlatButton(
          onPressed: () {
            print('Botão FlatButton clicado!');
          },
          color: Colors.orange,
          child: const Text(
            'Botão Depreciado',
            style: TextStyle(color: Colors.white),
          ),
        ),

        // Lista de receitas
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: receitas.length,
            itemBuilder: (context, index) =>
                ReceitaCard(receita: receitas[index]),
          ),
        ),
      ],
    );
  }

  // 2. Função que atualiza o estado quando uma aba é tocada.
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritas'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre'),
        ],
      ),
    );
  }
}

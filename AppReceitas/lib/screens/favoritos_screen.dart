import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/receita.dart';
import '../widgets/receita_card.dart';

class FavoritosScreen extends StatefulWidget {
  final List<Receita> todasAsReceitas;

  const FavoritosScreen({Key? key, required this.todasAsReceitas})
      : super(key: key);

  @override
  _FavoritosScreenState createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  List<Receita> _receitasFavoritas = [];

  static const double emptyMessageFontSize = 18.0;
  static const double listPadding = 12.0;

  @override
  void initState() {
    super.initState();
    _carregarFavoritos();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _carregarFavoritos();
  }

  _carregarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoritosIds = prefs.getStringList('favoritos') ?? [];

    // Filtra a lista de TODAS as receitas
    final List<Receita> favoritas = widget.todasAsReceitas
        .where((receita) => favoritosIds.contains(receita.nome))
        .toList();

    setState(() {
      _receitasFavoritas = favoritas;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_receitasFavoritas.isEmpty) {
      return Center(
        child: Text(
          'Você ainda não tem receitas favoritas!',
          style: TextStyle(
            fontSize: emptyMessageFontSize, // Constante usada aqui
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(listPadding), // Constante usada aqui
      itemCount: _receitasFavoritas.length,
      itemBuilder: (context, index) {
        return ReceitaCard(receita: _receitasFavoritas[index]);
      },
    );
  }
}
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

  @override
  void initState() {
    super.initState();
    _carregarFavoritos();
  }

  // Este método é chamado sempre que a aba de favoritos se torna visível.
  // Isso garante que a lista seja atualizada se o usuário desfavoritar um item.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _carregarFavoritos();
  }

  _carregarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoritosIds = prefs.getStringList('favoritos') ?? [];

    // Filtra a lista de TODAS as receitas, mantendo apenas aquelas cujo nome está na lista de IDs salvos.
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
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: _receitasFavoritas.length,
      itemBuilder: (context, index) {
        return ReceitaCard(receita: _receitasFavoritas[index]);
      },
    );
  }
}

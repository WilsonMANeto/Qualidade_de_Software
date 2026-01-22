import 'package:flutter/material.dart';
import '../models/receita.dart';
import '../screens/receita_detail_screen.dart';

class ReceitaCard extends StatelessWidget {
  final Receita receita;

  static const double cardVerticalMargin = 8.0;
  static const double cardBorderRadius = 12.0;
  static const double imageHeight = 180.0;
  static const double contentPadding = 12.0;
  static const double titleFontSize = 18.0;
  static const double spacingSmall = 4.0;
  static const double iconSize = 16.0;

  const ReceitaCard({required this.receita});

  void _abrirDetalhes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ReceitaDetailScreen(receita: receita),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _abrirDetalhes(context),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: cardVerticalMargin),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(cardBorderRadius),
              ),
              child: Image.asset(
                receita.imagem,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receita.nome,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: spacingSmall),
                  Row(
                    children: [
                      Icon(Icons.timer, size: iconSize),
                      SizedBox(width: spacingSmall),
                      Text(receita.tempoPreparo),
                    ],
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

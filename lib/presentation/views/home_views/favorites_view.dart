import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Favotires views'),
      ),
      body: Center(
        child: Text('Favoritos'),
      ),
    );
  }
}
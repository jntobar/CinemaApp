import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Acción',
      'Comedia',
      'Drama',
      'Terror',
      'Ciencia Ficción',
      'Animación',
      'Aventura',
      'Romance',
      'Documental',
      'Fantasía',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.local_movies_outlined),
            title: Text(categories[index]),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Aquí puedes navegar o mostrar películas de la categoría
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Seleccionaste: ${categories[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}
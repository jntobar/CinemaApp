//import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../views/views.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
      HomeView(),
      CategoriesView(),
      FavoritesView(),
      
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex,
      children: viewRoutes,

      ),
      bottomNavigationBar: CustomBottonNavigation(curretIndex:pageIndex),
    );
  }
}

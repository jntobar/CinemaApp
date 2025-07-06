//import 'package:cinemapedia/config/constants/environment.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

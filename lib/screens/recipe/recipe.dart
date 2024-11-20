import 'package:flutter/material.dart';
import 'package:touille/screens/recipe/recipe_body.dart';
import 'package:touille/screens/recipe/recipe_header.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          RecipeHeader(),
          RecipeBody(),
        ],
      ),
    );
  }
}

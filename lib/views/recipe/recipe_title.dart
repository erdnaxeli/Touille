import 'package:flutter/material.dart';
import 'package:touille/views/recipe/recipe_view_model.dart';

class RecipeTitle extends StatelessWidget {
  final RecipeViewModel recipeVM;

  const RecipeTitle({
    super.key,
    required this.recipeVM,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      recipeVM.recipe!.title.toUpperCase(),
      style: const TextStyle(
        fontFamily: 'BD Supper',
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

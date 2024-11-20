import 'package:flutter/material.dart';
import 'package:touille/views/recipe/recipe_view_model.dart';

class RecipeAuthor extends StatelessWidget {
  final String? defaultFontFamily;
  final RecipeViewModel recipeVM;

  const RecipeAuthor({
    super.key,
    required this.defaultFontFamily,
    required this.recipeVM,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Par ${recipeVM.recipe!.author}',
        style: TextStyle(
          fontFamily: defaultFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

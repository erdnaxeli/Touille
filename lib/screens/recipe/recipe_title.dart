import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touille/view_models/recipe.dart';

class RecipeTitle extends StatelessWidget {
  const RecipeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeViewModel>(
      builder: (context, recipeVM, child) {
        return Text(
          recipeVM.get()!.title.toUpperCase(),
          style: const TextStyle(
            fontFamily: 'BD Supper',
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

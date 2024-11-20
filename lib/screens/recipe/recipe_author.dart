import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touille/view_models/recipe.dart';

class RecipeAuthor extends StatelessWidget {
  const RecipeAuthor({
    super.key,
    required this.defaultFontFamily,
  });

  final String? defaultFontFamily;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Consumer<RecipeViewModel>(
        builder: (context, recipeVM, child) {
          return Text(
            'Par ${recipeVM.get()!.author}',
            style: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          );
        },
      ),
    );
  }
}

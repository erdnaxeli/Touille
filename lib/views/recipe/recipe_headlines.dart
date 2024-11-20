import 'package:flutter/material.dart';
import 'package:touille/views/recipe/recipe_view_model.dart';

class RecipeHeadlines extends StatelessWidget {
  final RecipeViewModel recipeVM;

  const RecipeHeadlines({
    super.key,
    required this.recipeVM,
  });

  @override
  Widget build(BuildContext context) {
    var recipe = recipeVM.recipe!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\u2022 ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PRÉPA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${recipe.prepareTime.inMinutes} min.',
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\u2022 ', style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CUISSON',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${recipe.cookingTime.inMinutes} min.',
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\u2022 ', style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'REPO',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${recipe.restTime.inMinutes} min.',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

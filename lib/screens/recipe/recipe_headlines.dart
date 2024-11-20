import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touille/view_models/recipe.dart';

class RecipeHeadlines extends StatelessWidget {
  const RecipeHeadlines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeViewModel>(
      builder: (context, recipeVM, child) {
        var recipe = recipeVM.get()!;

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
      },
    );
  }
}

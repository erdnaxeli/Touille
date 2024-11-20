import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:touille/views/recipe/recipe_view_model.dart';

class RecipePlayButton extends StatelessWidget {
  const RecipePlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        var recipeVM = Provider.of<RecipeViewModel>(context, listen: false);
        context.go('/recipe/${recipeVM.recipeId}/play');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'MODE LECTURE',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Icon(
            Icons.play_arrow,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}

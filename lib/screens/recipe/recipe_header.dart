import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touille/screens/recipe/recipe_author.dart';
import 'package:touille/screens/recipe/recipe_headlines.dart';
import 'package:touille/screens/recipe/recipe_play_button.dart';
import 'package:touille/screens/recipe/recipe_title.dart';
import 'package:touille/view_models/recipe.dart';

class RecipeHeader extends StatelessWidget {
  const RecipeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var defaultFontFamily = DefaultTextStyle.of(context).style.fontFamily;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Consumer<RecipeViewModel>(builder: (context, recipeVM, child) {
          var recipeId = recipeVM.recipeId;
          return Hero(
            tag: 'recipe-hero-$recipeId',
            child: Image.asset(
              'assets/recipe-$recipeId.png',
              fit: BoxFit.fill,
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              RecipeAuthor(defaultFontFamily: defaultFontFamily),
              RecipeTitle(),
              Divider(),
              RecipeHeadlines(),
              Divider(),
              RecipePlayButton(),
            ],
          ),
        ),
      ],
    );
  }
}

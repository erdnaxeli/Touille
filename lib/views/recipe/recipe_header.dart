import 'package:flutter/material.dart';
import 'package:touille/views/recipe/recipe_author.dart';
import 'package:touille/views/recipe/recipe_headlines.dart';
import 'package:touille/views/recipe/recipe_play_button.dart';
import 'package:touille/views/recipe/recipe_title.dart';
import 'package:touille/views/recipe/recipe_view_model.dart';

class RecipeHeader extends StatelessWidget {
  final RecipeViewModel recipeVM;

  const RecipeHeader({
    super.key,
    required this.recipeVM,
  });

  @override
  Widget build(BuildContext context) {
    var defaultFontFamily = DefaultTextStyle.of(context).style.fontFamily;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/recipe-${recipeVM.recipeId}.png',
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              RecipeAuthor(
                defaultFontFamily: defaultFontFamily,
                recipeVM: recipeVM,
              ),
              RecipeTitle(recipeVM: recipeVM),
              Divider(),
              RecipeHeadlines(recipeVM: recipeVM),
              Divider(),
              RecipePlayButton(),
            ],
          ),
        ),
      ],
    );
  }
}

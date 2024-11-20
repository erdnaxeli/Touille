import 'package:flutter/material.dart';
import 'package:touille/domain/models/recipe.dart';
import 'package:touille/domain/repositories/recipe_repository.dart';

class RecipesListViewModel extends ChangeNotifier {
  final RecipeRepository _recipeRepository;

  List<Recipe>? recipes;

  RecipesListViewModel(this._recipeRepository);

  load() async {
    print('Loading recipes');
    if (recipes != null) {
      return;
    }

    recipes = await _recipeRepository.getRecipes();
    notifyListeners();
  }
}

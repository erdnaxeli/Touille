import 'package:flutter/material.dart';
import 'package:touille/domain/models/recipe.dart';
import 'package:touille/domain/repositories/recipe_repository.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeRepository _recipeRepository;

  Recipe? recipe;
  final String recipeId;

  RecipeViewModel(this._recipeRepository, this.recipeId);

  Future<void> load() async {
    if (recipe != null) {
      return;
    }

    recipe = await _recipeRepository.getRecipe(recipeId);
    notifyListeners();
  }
}

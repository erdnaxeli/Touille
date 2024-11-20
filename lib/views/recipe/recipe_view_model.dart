import 'package:flutter/material.dart';
import 'package:touille/domain/models/recipe.dart';
import 'package:touille/domain/repositories/recipe_repository.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeRepository _recipeRepository;

  Recipe? _recipe;
  final String recipeId;

  RecipeViewModel(this._recipeRepository, this.recipeId);

  Recipe? get recipe {
    print('Getting recipe $recipeId: $_recipe');
    return _recipe;
  }

  Future<void> load() async {
    print('Loading recipe $recipeId');
    if (_recipe != null) {
      return;
    }

    _recipe = await _recipeRepository.getRecipe(recipeId);
    notifyListeners();
  }
}

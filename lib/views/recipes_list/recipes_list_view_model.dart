import 'package:flutter/material.dart';
import 'package:touille/domain/models/recipe.dart';
import 'package:touille/domain/repositories/recipe_repository.dart';

class RecipesListViewModel extends ChangeNotifier {
  final RecipeRepository _recipeRepository;

  List<Recipe>? _recipes;

  RecipesListViewModel(this._recipeRepository) {
    print('Creating recipes list view model!!!!!!!!!!');
  }

  List<Recipe>? get recipes => _recipes;

  load() async {
    print('Loading recipes');
    if (_recipes != null) {
      return;
    }

    _recipes = await _recipeRepository.getRecipes();
    print('Loaded recipes: $_recipes');
    notifyListeners();
  }
}

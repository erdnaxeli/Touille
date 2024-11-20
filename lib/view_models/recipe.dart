import 'package:flutter/material.dart';
import 'package:touille/models/recipe.dart';

class RecipeViewModel extends ChangeNotifier {
  RecipeData? _data;
  final RecipeModel _model;
  final String recipeId;

  RecipeViewModel(this._model, this.recipeId) {}

  RecipeData? get() {
    if (_data != null) {
      print('RecipeViewModel.get() cache hit');
      return _data;
    }

    print('RecipeViewModel.get() cache miss');
    _data = _model.get(recipeId);
    return _data;
  }
}

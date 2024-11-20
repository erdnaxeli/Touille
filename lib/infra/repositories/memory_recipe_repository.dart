import 'dart:collection';

import 'package:touille/domain/models/recipe.dart';
import 'package:touille/domain/repositories/recipe_repository.dart';

class MemoryRecipeRepository implements RecipeRepository {
  final recipes = [
    Recipe(
      id: uuid.v7(),
      author: 'Sandro',
      title: 'Nouilles sauce asiat\'',
      cookingTime: Duration(minutes: 45),
      prepareTime: Duration(minutes: 20),
      restTime: Duration(),
      image: 'assets/recipe-1.png',
      servings: 4,
    ),
    Recipe(
      id: uuid.v7(),
      author: 'Sandro',
      title: 'Banana bread',
      cookingTime: Duration(minutes: 60),
      prepareTime: Duration(minutes: 15),
      restTime: Duration(hours: 1),
      image: 'assets/recipe-2.png',
      servings: 8,
    ),
  ];

  @override
  Future<Recipe?> getRecipe(String recipeId) async {
    //await Future.delayed(Duration(milliseconds: 300));
    return recipes.firstWhere((recipe) => recipe.id == recipeId);
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    //await Future.delayed(Duration(milliseconds: 300));
    return UnmodifiableListView(recipes);
  }
}

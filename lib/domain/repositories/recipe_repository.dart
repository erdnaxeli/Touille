import 'package:touille/domain/models/recipe.dart';

abstract class RecipeRepository {
  Future<Recipe?> getRecipe(String id);

  Future<List<Recipe>> getRecipes();
}

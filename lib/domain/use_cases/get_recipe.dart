import 'package:touille/domain/models/recipe.dart';
import 'package:touille/domain/repositories/recipe_repository.dart';

class GetRecipe {
  final RecipeRepository _recipeRepository;

  GetRecipe(this._recipeRepository);

  Future<Recipe?> execute(String id) async {
    return _recipeRepository.getRecipe(id);
  }
}

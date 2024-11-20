import 'package:touille/infra/repositories/memory_recipe_repository.dart';
import 'package:touille/views/recipes_list/recipes_list_view_model.dart';

final recipesListViewModel = RecipesListViewModel(recipeRepository);
final recipeRepository = MemoryRecipeRepository();

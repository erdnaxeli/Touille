import 'package:flutter/material.dart';
import 'package:touille/registry.dart';
import 'package:touille/views/add_recipe/form/screen.dart';
import 'package:touille/views/add_recipe/screen.dart';
import 'package:touille/views/recipe/recipe.dart';
import 'package:touille/views/recipe/recipe_view_model.dart';
import 'package:touille/views/recipes_list/recipes_list.dart';

class TouilleRouter {
  Widget getAddRecipe() {
    return AddRecipeScreen(router: this);
  }

  Widget getRecipesList() {
    return RecipesListScreen(router: this, recipesListVM: recipesListViewModel);
  }

  Widget getFavorites() {
    return Scaffold(
      body: Center(
        child: Text('Favorites'),
      ),
    );
  }

  Widget getLucky() {
    return Scaffold(
      body: Center(
        child: Text('Lucky'),
      ),
    );
  }

  Widget getProfile() {
    return Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }

  void goToAddRecipeForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return AddRecipeFormScreen();
        },
      ),
    );
  }

  void goToRecipe(BuildContext context, String recipeId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return RecipeScreen(
            recipeVM: RecipeViewModel(
              recipeRepository,
              recipeId,
            ),
          );
        },
      ),
    );
  }
}

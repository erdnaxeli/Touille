import 'package:flutter/material.dart';
import 'package:touille/views/recipe/recipe_body.dart';
import 'package:touille/views/recipe/recipe_header.dart';
import 'package:touille/views/recipe/recipe_view_model.dart';

class RecipeScreen extends StatefulWidget {
  final RecipeViewModel recipeVM;

  const RecipeScreen({super.key, required this.recipeVM});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  void initState() {
    widget.recipeVM.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.recipeVM,
      builder: (context, child) => RecipeView(
        recipeVM: widget.recipeVM,
      ),
    );
  }
}

class RecipeView extends StatelessWidget {
  const RecipeView({
    super.key,
    required this.recipeVM,
  });

  final RecipeViewModel recipeVM;

  @override
  Widget build(BuildContext context) {
    if (recipeVM.recipe == null) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('chargement'),
              SizedBox(height: 40),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecipeHeader(recipeVM: recipeVM),
            RecipeBody(recipeVM: recipeVM),
          ],
        ),
      ),
    );
  }
}

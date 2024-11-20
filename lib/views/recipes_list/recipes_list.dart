import 'package:flutter/material.dart';
import 'package:touille/router.dart';
import 'package:touille/views/recipes_list/recipes_list_view_model.dart';

class RecipesListScreen extends StatelessWidget {
  final RecipesListViewModel recipesListVM;
  final TouilleRouter router;

  const RecipesListScreen({
    super.key,
    required this.router,
    required this.recipesListVM,
  });

  @override
  Widget build(BuildContext context) {
    recipesListVM.load();

    return ListenableBuilder(
      listenable: recipesListVM,
      builder: (context, child) => RecipesListView(
        router: router,
        recipesListVM: recipesListVM,
      ),
    );
  }
}

class RecipesListView extends StatefulWidget {
  final RecipesListViewModel recipesListVM;
  final TouilleRouter router;

  const RecipesListView({
    super.key,
    required this.router,
    required this.recipesListVM,
  });

  @override
  State<RecipesListView> createState() => _RecipesListViewState();
}

class _RecipesListViewState extends State<RecipesListView> {
  @override
  void initState() {
    super.initState();
    widget.recipesListVM.load();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.recipesListVM.recipes == null) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Chargement des recettes'),
              SizedBox(height: 40),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }

    return Center(
      child: ListView(
        children: [
          for (final recipe in widget.recipesListVM.recipes!)
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                widget.router.goToRecipe(context, recipe.id);
              },
              child: ListTile(
                title: Text(recipe.title),
                subtitle: Text(
                  '${recipe.totalTime.inMinutes}min. - ${recipe.servings} personnes',
                ),
                trailing: Image.asset(recipe.image),
              ),
            ),
        ],
      ),
    );
  }
}

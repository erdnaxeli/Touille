import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:touille/views/recipes_list/recipes_list_view_model.dart';

class RecipesListScreen extends StatelessWidget {
  final RecipesListViewModel recipesListVM;

  const RecipesListScreen({
    super.key,
    required this.recipesListVM,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: recipesListVM,
      builder: (context, child) => RecipesListView(
        recipesListVM: recipesListVM,
      ),
    );
  }
}

class RecipesListView extends StatefulWidget {
  final RecipesListViewModel recipesListVM;

  const RecipesListView({
    super.key,
    required this.recipesListVM,
  });

  @override
  State<RecipesListView> createState() {
    print('Creating state for recipes list');
    return _RecipesListViewState();
  }
}

class _RecipesListViewState extends State<RecipesListView> {
  @override
  void initState() {
    print('Init recipes list');
    widget.recipesListVM.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build recipes list with ${widget.recipesListVM.recipes}');
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
                context.go('/recipe/${recipe.id}');
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

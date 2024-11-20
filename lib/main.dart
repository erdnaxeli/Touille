import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:touille/domain/models/recipe.dart';
import 'package:touille/infra/repositories/memory_recipe_repository.dart';
import 'package:touille/views/recipe/recipe.dart';
import 'package:touille/views/recipes_list/recipes_list.dart';
import 'package:touille/views/recipe/recipe_view_model.dart';
import 'package:touille/views/recipes_list/recipes_list_view_model.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => MyHomePage(
        selectedPage: 0,
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => RecipesListScreen(
            recipesListVM: RecipesListViewModel(MemoryRecipeRepository()),
          ),
          routes: [
            GoRoute(
              path: 'recipe/:id',
              builder: (context, state) {
                return RecipeScreen(
                  recipeVM: RecipeViewModel(
                    MemoryRecipeRepository(),
                    state.pathParameters['id']!,
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: 'play',
                  builder: (context, state) {
                    return const Scaffold(
                      body: Center(
                        child: Text('Playing the recipe'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Touille !',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 223, 102, 3),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'BD Supper',
            ),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Widget child;
  final int selectedPage;

  const MyHomePage({
    super.key,
    required this.child,
    required this.selectedPage,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;

  @override
  void initState() {
    _selectedPage = widget.selectedPage;
    super.initState();
  }

  void _selectPage(value) {
    setState(() {
      _selectedPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page = widget.child;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Touille !'),
      ),
      body: page,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: _selectPage,
        selectedIndex: _selectedPage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Créer une nouvelle recette',
          ),
          NavigationDestination(
            icon: Icon(Icons.shuffle),
            label: 'Une recette au hasard',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Mon profil',
          ),
        ],
      ),
    );
  }
}

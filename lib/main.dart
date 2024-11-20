import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:touille/models/recipe.dart';
import 'package:touille/screens/recipe/recipe.dart';
import 'package:touille/screens/recipes_list.dart';
import 'package:touille/view_models/recipe.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Touille !'),
      routes: [
        GoRoute(
          path: 'recipe/:id',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (context) =>
                  RecipeViewModel(RecipeModel(), state.pathParameters['id']!),
              child: Recipe(),
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
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;

  void _selectPage(value) {
    setState(() {
      _selectedPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedPage) {
      case 0:
        page = const RecipesList();
      case 1:
        page = const RecipesList();
      case 2:
        page = const RecipesList();
      case 3:
        page = const RecipesList();
      case 4:
        page = const RecipesList();
      default:
        throw Exception('Page not found');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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

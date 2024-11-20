import 'package:flutter/material.dart';
import 'package:touille/router.dart';

class NavBarScreen extends StatefulWidget {
  final TouilleRouter router;

  final List<Widget Function()> _pages;

  NavBarScreen({
    super.key,
    required this.router,
  }) : _pages = [
          router.getRecipesList,
          router.getAddRecipe,
          router.getFavorites,
          router.getLucky,
          router.getProfile,
        ];

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int selectedPage = 0;

  void _selectPage(value) {
    setState(() {
      selectedPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page = widget._pages[selectedPage]();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Touille !'),
      ),
      body: page,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: _selectPage,
        selectedIndex: selectedPage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Créer une nouvelle recette',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
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

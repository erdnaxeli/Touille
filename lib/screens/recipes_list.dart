import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              context.go('/recipe/1');
            },
            child: ListTile(
              title: const Text('Nouilles sauce asiat\''),
              subtitle: const Text('30min - 4 personnes'),
              trailing: Hero(
                tag: 'recipe-hero-1',
                child: Image.asset('assets/recipe-1.png'),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              context.go('/recipe/2');
            },
            child: ListTile(
              title: const Text('Banana bread'),
              subtitle: const Text('1h - 6 personnes'),
              trailing: Hero(
                tag: 'recipe-hero-2',
                child: Image.asset('assets/recipe-2.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

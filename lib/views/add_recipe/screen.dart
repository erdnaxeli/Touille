import 'package:flutter/material.dart';
import 'package:touille/router.dart';

class AddRecipeScreen extends StatelessWidget {
  final TouilleRouter router;

  const AddRecipeScreen({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("Reprendre un brouillon"),
                  FilledButton(
                    onPressed: () => {},
                    child: Text("Blanquette de seitan"),
                  ),
                  FilledButton(
                    onPressed: () => {},
                    child: Text("Fondue de chou"),
                  ),
                  FilledButton(
                    onPressed: () => {},
                    child: Text("Banana bread à la noix"),
                  ),
                  FilledButton(
                    onPressed: () => {},
                    child: Text("Dahl de lentilles"),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('ou'),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Créer une nouvelle recette"),
                  IconButton(
                    onPressed: () => router.goToAddRecipeForm(context),
                    icon: Icon(
                      Icons.add_circle,
                      size: 108,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

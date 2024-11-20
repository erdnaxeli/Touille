import 'package:touille/domain/models/recipe.dart';

enum Diet {
  omnivore("omnivore"),
  vegan("végétalien"),
  vegetarian("végétarien");

  const Diet(this.text);

  final String text;
}

class RecipeForm {
  // step 1
  String? title;
  String? description;
  String? source;

  // step 2
  Diet? diet;
  Set<String> tags = {};
  int? servings;

  Duration? cookingTime;
  Duration? preparationTime;
  Duration? restTime;

  // step 3
  List<RecipeIngredient> ingredients = [];

  // step 4
  List<RecipeStep> steps = [];

  @override
  String toString() {
    return 'RecipeForm{title: $title, source: $source, tags: $tags, servings: $servings, preparationTime: $preparationTime}';
  }
}

enum QuantityUnit {
  gram("g"),
  kilogram("kg"),
  liter("L"),
  centiliter("cL"),
  milliliter("mL"),
  teaspoon("cuillère à café", smallText: "cc"),
  tablespoon("cuillère à soupe", smallText: "cs"),
  unit("unité", smallText: "");

  const QuantityUnit(this.fullText, {smallText})
      : smallText = smallText ?? fullText;

  final String fullText;
  final String smallText;
}

class RecipeIngredient {
  final String name;
  final int quantity;
  final QuantityUnit unit;

  RecipeIngredient({
    required this.name,
    required this.quantity,
    required this.unit,
  });

  @override
  String toString() {
    return 'RecipeIngredient{name: $name, quantity: $quantity, unit: $unit}';
  }
}

class RecipeStep {
  final String description;

  RecipeStep({required this.description});
}

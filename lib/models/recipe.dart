import 'package:uuid/uuid.dart';

class RecipeData {
  String id;

  String author;
  String title;

  Duration cookingTime;
  Duration prepareTime;
  Duration restTime;

  RecipeData({
    required this.id,
    required this.author,
    required this.title,
    required this.cookingTime,
    required this.prepareTime,
    required this.restTime,
  });
}

final uuid = Uuid();

class RecipeModel {
  final recipes = {
    '1': RecipeData(
      id: '1',
      author: 'Sandro',
      title: 'Nouilles sauce asiat\'',
      cookingTime: Duration(minutes: 45),
      prepareTime: Duration(minutes: 20),
      restTime: Duration(),
    ),
    uuid.v7(): RecipeData(
      id: '2',
      author: 'Sandro',
      title: 'Banana bread',
      cookingTime: Duration(minutes: 60),
      prepareTime: Duration(minutes: 15),
      restTime: Duration(hours: 1),
    ),
  };

  RecipeData? get(String recipeId) {
    return recipes[recipeId];
  }
}

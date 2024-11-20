import 'package:uuid/uuid.dart';

class Recipe {
  String id;

  String author;
  String title;

  Duration cookingTime;
  Duration prepareTime;
  Duration restTime;

  String image;
  int servings;

  Duration get totalTime => cookingTime + prepareTime + restTime;

  Recipe({
    required this.id,
    required this.author,
    required this.title,
    required this.cookingTime,
    required this.prepareTime,
    required this.restTime,
    required this.image,
    required this.servings,
  });
}

final uuid = Uuid();

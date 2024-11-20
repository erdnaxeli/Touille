import 'package:flutter/material.dart';
import 'package:touille/views/add_recipe/form/diet_selector.dart';
import 'package:touille/views/add_recipe/form/duration_picker_button.dart';
import 'package:touille/views/add_recipe/form/form_model.dart';
import 'package:touille/views/add_recipe/form/number_selector.dart';
import 'package:touille/views/add_recipe/form/tag_selector.dart';

class Step2 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final RecipeForm formData;
  final void Function() onSubmit;

  const Step2({
    super.key,
    required this.formKey,
    required this.formData,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Régime alimentaire :",
            ),
          ),
          DietSelector(formData: formData),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Type de plat :",
            ),
          ),
          TagSelector(
            hintText: "entrée, fête, soupe, cuisine française, ...",
            tags: [
              'entrée',
              'plat principal',
              'dessert',
              'boisson',
              'soupe',
              'cocktail',
              'virgin cocktail',
              'cuisine française',
              'cuisine asiatique',
              'sans gluten',
              'sans lactose',
              'pique nique',
              'fête',
              'enfants',
            ],
            onChanged: (value) => formData.tags = value,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Temps de préparation :"),
              SizedBox(width: 40),
              DurationPickerButton(
                initialDuration: formData.preparationTime,
                onChanged: (value) => formData.preparationTime = value,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Temps de cuisson :"),
              SizedBox(width: 40),
              DurationPickerButton(
                initialDuration: formData.cookingTime,
                onChanged: (value) => formData.cookingTime = value,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Temps de repos :"),
              SizedBox(width: 40),
              DurationPickerButton(
                initialDuration: formData.restTime,
                onChanged: (value) => formData.restTime = value,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Portions :"),
              SizedBox(width: 40),
              NumberSelector(
                onChanged: (value) =>
                    formData.servings = value > 0 ? value : null,
                initialValue: formData.servings,
                minValue: 0,
              ),
            ],
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onSubmit();
              }
            },
            child: Text("Suivant"),
          ),
        ],
      ),
    );
  }
}

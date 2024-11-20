import 'package:flutter/material.dart';
import 'package:touille/views/add_recipe/form/form_model.dart';

class Step1 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final RecipeForm formData;
  final void Function() onSubmit;

  const Step1({
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
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              filled: true,
              labelText: "Nom de la recette",
            ),
            initialValue: formData.title,
            maxLength: 50,
            maxLines: 1,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez saisir un titre";
              } else {
                return null;
              }
            },
            onChanged: (value) => formData.title = value,
          ),
          SizedBox(height: 40),
          TextFormField(
            decoration: const InputDecoration(
              filled: true,
              labelText: "Description",
            ),
            initialValue: formData.description,
            maxLength: 400,
            maxLines: 3,
            onChanged: (value) => formData.description = value,
          ),
          SizedBox(height: 40),
          TextFormField(
            decoration: const InputDecoration(
              filled: true,
              labelText: "Source (facultatif)",
            ),
            initialValue: formData.source,
            maxLength: 100,
            maxLines: 1,
            onChanged: (value) => formData.source = value,
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

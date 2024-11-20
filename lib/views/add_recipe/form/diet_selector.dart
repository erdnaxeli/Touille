import 'package:flutter/material.dart';
import 'package:touille/views/add_recipe/form/form_model.dart';

class DietSelector extends StatefulWidget {
  const DietSelector({
    super.key,
    required this.formData,
  });

  final RecipeForm formData;

  @override
  State<DietSelector> createState() => _DietSelectorState();
}

class _DietSelectorState extends State<DietSelector> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        for (var diet in Diet.values)
          ChoiceChip(
            label: Text(diet.text),
            onSelected: (value) {
              setState(() {
                if (!value) {
                  widget.formData.diet = null;
                } else {
                  widget.formData.diet = diet;
                }
              });
            },
            selected: widget.formData.diet == diet,
          ),
      ],
    );
  }
}

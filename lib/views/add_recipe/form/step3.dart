import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touille/views/add_recipe/form/form_model.dart';

class Step3 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final RecipeForm formData;
  final void Function() onSubmit;

  const Step3({
    super.key,
    required this.formKey,
    required this.formData,
    required this.onSubmit,
  });

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Form(
            key: widget.formKey,
            child: ListView(
              children: [
                TextButton(
                  onPressed: () async {
                    final ingredient = await showDialog<RecipeIngredient?>(
                      context: context,
                      builder: (context) => AddIngredientDialog(),
                    );
                    if (ingredient != null) {
                      setState(
                        () => widget.formData.ingredients.add(ingredient),
                      );
                    }
                  },
                  child: Text("Ajouter un ingrédient"),
                ),
                for (var ingredient in widget.formData.ingredients)
                  ListTile(
                    title: Text(ingredient.name),
                    subtitle: Text(
                      "${ingredient.quantity} ${ingredient.unit != QuantityUnit.unit ? ingredient.unit.fullText : ""}",
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(
                          () => widget.formData.ingredients.remove(ingredient),
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                    onTap: () async {
                      final updatedIngredient =
                          await showDialog<RecipeIngredient?>(
                        context: context,
                        builder: (context) => AddIngredientDialog(
                          name: ingredient.name,
                          quantity: ingredient.quantity,
                          unit: ingredient.unit,
                        ),
                      );
                      if (updatedIngredient != null) {
                        setState(() {
                          final index =
                              widget.formData.ingredients.indexOf(ingredient);
                          widget.formData.ingredients[index] =
                              updatedIngredient;
                        });
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => widget.onSubmit(),
          child: Text("Suivant"),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class AddIngredientDialog extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  final String name;
  final int quantity;
  final QuantityUnit unit;

  AddIngredientDialog({
    super.key,
    this.name = "",
    this.quantity = 0,
    this.unit = QuantityUnit.unit,
  });

  @override
  State<AddIngredientDialog> createState() => _AddIngredientDialogState();
}

class _AddIngredientDialogState extends State<AddIngredientDialog> {
  @override
  Widget build(BuildContext context) {
    var name = "";
    var quantity = 0;
    var unit = QuantityUnit.unit;

    return AlertDialog(
      title: Text("Ajouter un ingrédient"),
      content: Form(
        key: widget._formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                labelText: "Nom de l'ingrédient",
              ),
              initialValue: widget.name,
              maxLength: 50,
              maxLines: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez saisir un nom";
                } else {
                  return null;
                }
              },
              onSaved: (value) => name = value!,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                labelText: "Quantité",
              ),
              initialValue:
                  widget.quantity > 0 ? widget.quantity.toString() : null,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              maxLength: 4,
              maxLines: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez saisir une quantité";
                } else {
                  return null;
                }
              },
              onSaved: (value) => quantity = int.parse(value!),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                filled: true,
                labelText: "Unité de mesure",
              ),
              items: [
                for (var unit in QuantityUnit.values)
                  DropdownMenuItem(
                    value: unit,
                    child: Text(unit.fullText),
                  ),
              ],
              onChanged: (value) => unit = value!,
              value: widget.unit,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Annuler"),
        ),
        ElevatedButton(
          onPressed: () {
            if (!widget._formKey.currentState!.validate()) return;

            widget._formKey.currentState!.save();
            Navigator.of(context).pop(
              RecipeIngredient(name: name, quantity: quantity, unit: unit),
            );
          },
          child: Text("Ajouter"),
        ),
      ],
    );
  }
}

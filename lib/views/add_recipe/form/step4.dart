import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:touille/views/add_recipe/form/form_model.dart';

class Step4 extends StatefulWidget {
  final RecipeForm formData;
  final void Function() onSubmit;
  final _formKey = GlobalKey<FormState>();

  Step4({
    super.key,
    required this.formData,
    required this.onSubmit,
  });

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  final _pageController = PageController();
  var _editingIdx = 0;

  initState() {
    super.initState();
    if (widget.formData.steps.isEmpty) {
      widget.formData.steps.add(RecipeStep(description: ""));
    }
  }

  @override
  Widget build(BuildContext context) {
    var listElements = <Widget>[];

    for (final (idx, step) in widget.formData.steps.indexed) {
      Widget element;

      if (idx == _editingIdx) {
        element = Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              filled: false,
            ),
            expands: true,
            keyboardType: TextInputType.text,
            maxLength: 500,
            maxLines: null,
            inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
            onFieldSubmitted: (value) =>
                setState(() => _editingIdx = widget.formData.steps.length),
            onChanged: (value) =>
                widget.formData.steps[idx] = RecipeStep(description: value),
          ),
        );
      } else {
        element = ListTile(
          title: AutoSizeText(
            step.description,
            maxFontSize: 60,
            minFontSize: 10,
            style: TextStyle(fontSize: 60),
          ),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                widget.formData.steps.removeAt(idx);
                if (_editingIdx > idx) _editingIdx--;

                if (widget.formData.steps.isEmpty) {
                  widget.formData.steps.add(RecipeStep(description: ""));
                }
              });
            },
            icon: Icon(Icons.delete),
          ),
        );
      }

      var columnChildren = [
        Text("Étape ${idx + 1}"),
        element,
      ];

      if (idx == widget.formData.steps.length - 1) {
        columnChildren.add(
          IconButton(
            icon: Icon(Icons.add_circle),
            iconSize: 64,
            onPressed: () {
              setState(() {
                _editingIdx = idx + 1;
                widget.formData.steps.add(RecipeStep(description: ""));
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  _pageController.animateToPage(
                    _editingIdx,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                });
              });
            },
          ),
        );
      }

      listElements.add(Column(children: columnChildren));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: listElements,
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

import 'package:flutter/material.dart';
import 'package:touille/views/add_recipe/form/form_model.dart';
import 'package:touille/views/add_recipe/form/step1.dart';
import 'package:touille/views/add_recipe/form/step2.dart';
import 'package:touille/views/add_recipe/form/step3.dart';
import 'package:touille/views/add_recipe/form/step4.dart';
import 'package:touille/views/add_recipe/form/step_markers.dart';

class AddRecipeFormScreen extends StatefulWidget {
  const AddRecipeFormScreen({super.key});

  @override
  State<AddRecipeFormScreen> createState() => _AddRecipeFormScreenState();
}

class _AddRecipeFormScreenState extends State<AddRecipeFormScreen> {
  var step = 1;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formData = RecipeForm();

  @override
  void initState() {
    super.initState();

    // todo create draft
  }

  @override
  void dispose() {
    _formKey1.currentState?.dispose();
    _formKey2.currentState?.dispose();
    _formKey3.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var form = _stepForm;
    var navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: (step > 1)
            ? IconButton(
                onPressed: () => setState(() => step--),
                icon: const Icon(Icons.arrow_back_ios_new),
              )
            : null,
        title: Text(_stepTitle),
        actions: [
          IconButton(
            onPressed: () => navigator.pop(),
            icon: const Icon(
              Icons.close,
              size: 32,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              StepsMarkers(current: step, count: 6),
              SizedBox(height: 40),
              Expanded(child: form),
            ],
          ),
        ),
      ),
    );
  }

  String get _stepTitle {
    if (step == 1) return "Nouvelle recette";
    if (step == 2) return "Caractéristiques";
    if (step == 3) return "Ingrédients";
    if (step == 4) return "Étapes";
    if (step == 5) return "Photos";
    if (step == 6) return "Aperçu";

    throw Exception("Invalid step: $step");
  }

  Widget get _stepForm {
    if (step == 1) {
      return Step1(
        formKey: _formKey1,
        formData: _formData,
        onSubmit: () => setState(() => step++),
      );
    }
    if (step == 2) {
      return Step2(
        formKey: _formKey2,
        formData: _formData,
        onSubmit: () => setState(() => step++),
      );
    }
    if (step == 3) {
      return Step3(
        formKey: _formKey3,
        formData: _formData,
        onSubmit: () => setState(() => step++),
      );
    }
    if (step == 4) {
      return Step4(formData: _formData, onSubmit: () => setState(() => step++));
    }
    if (step == 5) {
      return Form(key: _formKey1, child: Column(children: []));
    }
    if (step == 6) {
      return Form(key: _formKey1, child: Column(children: []));
    }

    throw Exception("Invalid step: $step");
  }
}

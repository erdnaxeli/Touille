import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  final void Function(int) onChanged;
  final int? initialValue;
  final int? minValue;
  final int? maxValue;

  const NumberSelector({
    super.key,
    required this.onChanged,
    this.initialValue,
    this.minValue,
    this.maxValue,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue ?? widget.minValue ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              final minValue = widget.minValue;
              if (minValue != null && value <= minValue) return;
              value--;
            });
            widget.onChanged(value);
          },
          icon: const Icon(Icons.remove),
        ),
        Text(value.toString()),
        IconButton(
          onPressed: () {
            setState(() {
              final maxValue = widget.maxValue;
              if (maxValue != null && value >= maxValue) return;
              value++;
            });
            widget.onChanged(value);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

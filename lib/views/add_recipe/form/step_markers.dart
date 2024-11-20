import 'package:flutter/material.dart';

class StepsMarkers extends StatelessWidget {
  final int current;
  final int count;

  StepsMarkers({
    super.key,
    required this.current,
    required this.count,
  }) {
    assert(count > 0);
    assert(current >= 0 && current <= count);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < count; i++) _stepMarker(isDone: i < current),
      ],
    );
  }

  Widget _stepMarker({
    bool isDone = false,
  }) {
    return Expanded(
      child: Divider(
        color: isDone ? Colors.black : Colors.grey,
        indent: 5,
        endIndent: 5,
        thickness: 2,
      ),
    );
  }
}

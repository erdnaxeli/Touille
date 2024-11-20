import 'package:flutter/material.dart';

class DurationPickerButton extends StatefulWidget {
  final Duration? initialDuration;
  final void Function(Duration)? onChanged;

  const DurationPickerButton({
    super.key,
    this.initialDuration,
    this.onChanged,
  });

  @override
  State<DurationPickerButton> createState() => _DurationPickerButtonState();
}

class _DurationPickerButtonState extends State<DurationPickerButton> {
  Duration? duration;

  @override
  void initState() {
    super.initState();
    duration = widget.initialDuration;
  }

  @override
  Widget build(BuildContext context) {
    final duration = this.duration;
    String buttonText = "00h 00min";
    if (duration != null) {
      buttonText =
          "${duration.inHours.toString().padLeft(2, '0')}h ${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}min";
    }

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      onPressed: () async {
        var result = await showDialog<Duration>(
          context: context,
          builder: (context) => DurationPicker(),
        );

        if (result != null) {
          setState(() => this.duration = result);
          widget.onChanged?.call(result);
        }
      },
      child: Text(buttonText),
    );
  }
}

class DurationPicker extends StatefulWidget {
  final Duration? initialDuration;

  const DurationPicker({
    super.key,
    this.initialDuration,
  });

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late Duration duration;
  var numbers = <int>[];

  @override
  void initState() {
    super.initState();
    duration = widget.initialDuration ?? Duration.zero;
  }

  @override
  Widget build(BuildContext context) {
    String hours;
    String minutes;

    if (numbers.length > 3) {
      hours = "${numbers[0]}${numbers[1]}";
      minutes = "${numbers[2]}${numbers[3]}";
    } else if (numbers.length == 3) {
      hours = "0${numbers[0]}";
      minutes = "${numbers[1]}${numbers[2]}";
    } else if (numbers.length == 2) {
      hours = "00";
      minutes = "${numbers[0]}${numbers[1]}";
    } else if (numbers.length == 1) {
      hours = "00";
      minutes = "0${numbers[0]}";
    } else {
      hours = "00";
      minutes = "00";
    }

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  hours,
                  style: const TextStyle(
                    fontFamily: "Roboto Mono",
                    fontSize: 60,
                  ),
                ),
                Text(
                  "h",
                  style:
                      const TextStyle(fontFamily: "Roboto Mono", fontSize: 20),
                ),
                SizedBox(width: 10),
                Text(
                  minutes,
                  style: const TextStyle(
                    fontFamily: "Roboto Mono",
                    fontSize: 60,
                  ),
                ),
                Text(
                  "min",
                  style:
                      const TextStyle(fontFamily: "Roboto Mono", fontSize: 20),
                ),
              ],
            ),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              shrinkWrap: true,
              children: [
                for (var i = 1; i < 10; i++)
                  FilledButton.tonal(
                    onPressed: () {
                      setState(() {
                        if (i == 0 && numbers.isEmpty) return;
                        if (numbers.length < 4) numbers.add(i);
                      });
                    },
                    child: Text(i.toString()),
                  ),
                FilledButton.tonal(
                  onPressed: () {
                    setState(() {
                      if (numbers.isEmpty) return;
                      if (numbers.length < 4) {
                        numbers.add(0);
                        if (numbers.length < 4) numbers.add(0);
                      }
                    });
                  },
                  child: Text("00"),
                ),
                FilledButton.tonal(
                  onPressed: () {
                    setState(() {
                      if (numbers.isEmpty) return;
                      if (numbers.length < 4) numbers.add(0);
                    });
                  },
                  child: Text("0"),
                ),
                FilledButton.tonal(
                  onPressed: () {
                    setState(() {
                      if (numbers.isNotEmpty) numbers.removeLast();
                    });
                  },
                  child: const Icon(Icons.backspace),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                int hours;
                int minutes;

                if (numbers.length > 3) {
                  hours = numbers[0] * 10 + numbers[1];
                  minutes = numbers[2] * 10 + numbers[3];
                } else if (numbers.length == 3) {
                  hours = numbers[0];
                  minutes = numbers[1] * 10 + numbers[2];
                } else if (numbers.length == 2) {
                  hours = 0;
                  minutes = numbers[0] * 10 + numbers[1];
                } else if (numbers.length == 1) {
                  hours = 0;
                  minutes = numbers[0];
                } else {
                  hours = 0;
                  minutes = 0;
                }

                var duration = Duration(hours: hours, minutes: minutes);
                Navigator.of(context).pop(duration);
              },
              child: Text("ok"),
            ),
          ],
        ),
      ),
    );
  }
}

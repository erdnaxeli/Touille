import 'package:flutter/material.dart';

class TagSelector extends StatefulWidget {
  final List<String> tags;
  final void Function(Set<String>)? onChanged;
  final String? hintText;

  const TagSelector({
    super.key,
    this.hintText,
    required this.tags,
    this.onChanged,
  });

  @override
  State<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  final Set<String> _selectedTags = {};
  late List<String> _tags;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _tags = widget.tags;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Autocomplete(
          fieldViewBuilder: (
            context,
            textEditingController,
            focusNode,
            onFieldSubmitted,
          ) {
            _textEditingController = textEditingController;
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                filled: true,
                hintText: widget.hintText,
              ),
              onFieldSubmitted: (value) {
                if (value.isEmpty) return;
                _onTag(value);
              },
            );
          },
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.length < 3) return const <String>[];
            return _tags.where(
              (element) => element.contains(textEditingValue.text),
            );
          },
          onSelected: (value) => _onTag(value),
        ),
        Wrap(
          spacing: 8,
          children: [
            for (var tag in _selectedTags)
              Chip(
                label: Text(tag),
                onDeleted: () {
                  setState(() {
                    _selectedTags.remove(tag);
                  });
                },
              ),
          ],
        ),
      ],
    );
  }

  void _onTag(String value) {
    setState(() => _selectedTags.add(value));
    _textEditingController.clear();
    widget.onChanged?.call(_selectedTags);
  }
}

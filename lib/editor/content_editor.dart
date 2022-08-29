import 'package:flutter/material.dart';

class ContentEditor extends StatelessWidget {
  const ContentEditor({
    Key? key,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final void Function(String value) onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextArea(
              initialValue: initialValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class TextArea extends StatelessWidget {
  const TextArea({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final String? initialValue;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.grey, width: 4),
          ),
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            // contentPadding: EdgeInsets.zero,
            isDense: true,

            border: InputBorder.none,
            hintText: "Content",
          ),
          maxLines: null,
          initialValue: initialValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

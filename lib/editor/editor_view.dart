import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EditorView extends HookWidget {
  const EditorView(this.noteId, {super.key});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(),
            ),
          ],
        )
      ],
    );
  }
}

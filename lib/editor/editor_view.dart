import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes/editor/content_editor.dart';
import 'package:notes/editor/editor_view_model.dart';

class EditorView extends HookWidget {
  EditorView(this.noteId, {super.key}) : vm = EditorViewModel(noteId);

  final String noteId;
  final EditorViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Title"),
                    style: const TextStyle(fontSize: 16),
                    initialValue: vm.title,
                    onChanged: vm.changeTitle,
                  ),
                ),
              ],
            ),
          );
        }),
        Expanded(
          child: ContentEditor(
            key: Key(noteId),
            initialValue: vm.content,
            onChanged: vm.changeContent,
          ),
        ),
      ],
    );
  }
}


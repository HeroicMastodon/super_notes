import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes/editor/editor_view_model.dart';
import 'package:super_editor/super_editor.dart';

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
                    key: Key(vm.title),
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
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Padding(
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
                      key: Key(vm.content),
                      initialValue: vm.content,
                      onChanged: vm.changeContent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

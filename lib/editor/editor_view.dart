import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes/editor/editor_view_model.dart';
import 'package:notes/shared/widgets/loader.dart';

class EditorView extends HookWidget {
  EditorView(this.noteId, {super.key}) : vm = EditorViewModel(noteId);

  final String noteId;
  final EditorViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!vm.loading) ...[
          Observer(builder: (context) {
            return Row(
              children: [
                Expanded(
                  child: TextFormField(
                    key: Key(vm.title),
                    initialValue: vm.title,
                    onChanged: vm.changeTitle,
                  ),
                ),
              ],
            );
          }),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  key: Key(vm.content),
                  initialValue: vm.content,
                  onChanged: vm.changeContent,
                ),
              ),
            ],
          )
        ] else
          const Loader(),
      ],
    );
  }
}

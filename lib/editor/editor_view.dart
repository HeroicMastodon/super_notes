import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/editor/editor_view_model.dart';
import 'package:notes/shared/widgets/loader.dart';

class EditorView extends HookWidget {
  const EditorView(this.noteId, {super.key});

  final String noteId;

  @override
  Widget build(BuildContext context) {
    final vm = useState(EditorViewModel()..init(noteId)).value;

    return Column(
      children: [
        if (!vm.loading) ...[
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: vm.title,
                  onChanged: vm.changeTitle,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
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

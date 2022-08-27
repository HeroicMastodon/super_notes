import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes/list/note/note_view_model.dart';

class NoteView extends HookWidget {
  NoteView(
    this.id, {
    super.key,
    required this.onNoteSelected,
  }) : vm = NoteViewModel(id);

  final String id;
  final void Function(String id) onNoteSelected;
  final NoteViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onNoteSelected(id),
      title: Observer(builder: (context) {
        return Text(vm.title);
      }),
      subtitle: Observer(builder: (context) {
        return Text(vm.dateCreated);
      }),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: vm.onDelete,
      ),
    );
  }
}

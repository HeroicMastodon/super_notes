import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:notes/list/note/note_view_model.dart';

class NoteView extends HookWidget {
  NoteView(
    this.id, {
    super.key,
    required this.onNoteSelected,
  }) : viewModel = NoteViewModel(id);

  final String id;
  final NoteViewModel viewModel;
  final void Function(String id) onNoteSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onNoteSelected(id),
      title: Text(viewModel.title),
      subtitle: Text(viewModel.dateCreated),
    );
  }
}

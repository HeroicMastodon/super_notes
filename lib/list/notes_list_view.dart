import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/list/note/note_view.dart';
import 'package:notes/list/notes_list_view_model.dart';

class NotesListView extends HookWidget {
  const NotesListView({
    super.key,
    required this.onNoteSelected,
  });

  final void Function(String id) onNoteSelected;

  @override
  Widget build(BuildContext context) {
    final viewModel = useState(NotesListViewModel()..init()).value;

    return ListView.builder(
      itemBuilder: (context, index) => NoteView(
        viewModel.noteIds[index],
        onNoteSelected: onNoteSelected,
      ),
      itemCount: viewModel.noteIds.length,
    );
  }
}

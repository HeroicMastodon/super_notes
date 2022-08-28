import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes/list/note/note_view.dart';
import 'package:notes/list/notes_list_view_model.dart';

class NotesListView extends HookWidget {
  NotesListView({
    super.key,
    required this.onNoteSelected,
  });

  final void Function(String? id) onNoteSelected;
  final NotesListViewModel viewModel = NotesListViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
          itemBuilder: (context, index) => NoteView(
            viewModel.noteIds[index],
            onNoteSelected: onNoteSelected,
          ),
          itemCount: viewModel.noteIds.length,
        );
      }
    );
  }
}

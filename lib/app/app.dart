import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/app/app_view_model.dart';
import 'package:notes/editor/editor_view.dart';
import 'package:notes/list/notes_list_view.dart';

class NotesApp extends HookWidget {
  NotesApp({super.key});

  final AppViewModel viewModel = AppViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.title),
        ),
        body: Row(
          children: [
            NotesListView(
              onNoteSelected: viewModel.selectNote,
            ),
            if (viewModel.selectedNoteId != null)
              EditorView(viewModel.selectedNoteId!),
          ],
        ),
      ),
    );
  }
}

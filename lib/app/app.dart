import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes/app/app_view_model.dart';
import 'package:notes/editor/editor_view.dart';
import 'package:notes/list/notes_list_view.dart';

class NotesApp extends HookWidget {
  NotesApp({super.key});

  final AppViewModel vm = AppViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              secondary: Colors.blueAccent,
              onSecondary: Colors.white,
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Observer(builder: (context) {
            return Row(
              children: [
                if (vm.selectedNoteId != null)
                  IconButton(
                    onPressed: () => vm.selectNote(null),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                Text(vm.title),
              ],
            );
          }),
        ),
        body: Observer(builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              vm.selectedNoteId == null
                  ? Expanded(
                      child: NotesListView(onNoteSelected: vm.selectNote),
                    )
                  : ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 240),
                      child: NotesListView(
                        onNoteSelected: vm.selectNote,
                      ),
                    ),
              if (vm.selectedNoteId != null)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Theme.of(context).colorScheme.surface,
                          width: 4,
                        ),
                      ),
                    ),
                    child: EditorView(vm.selectedNoteId!),
                  ),
                ),
            ],
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: vm.createNote,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

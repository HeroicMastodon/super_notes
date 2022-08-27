// ignore_for_file: prefer_final_fields

import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:notes/setup.dart';
import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/queries/notes_queries.dart';

part 'note_store.g.dart';

class NoteStore = NoteStoreBase with _$NoteStore;

abstract class NoteStoreBase with Store {
  final _queries = inject<NotesQueries>();
  @observable
  ObservableList<Note> _notes = ObservableList.of([]);

  @computed
  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  Note? getNoteById(String id) {
    final index = _notes.indexWhere((e) => e.id == id);
    return index < 0 ? null : _notes[index];
  }

  @action
  void addNote(Note note) {
    _notes.add(note);
  }

  @action
  void deleteNote(Note note) {
    _notes.remove(note);
  }

  @action
  Future<void> init() async {
    _notes.addAll(await _queries.listNotes());
  }
}

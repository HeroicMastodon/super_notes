// ignore_for_file: prefer_final_fields

import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:notes/shared/note/note.dart';

part 'note_store.g.dart';

class NoteStore = NoteStoreBase with _$NoteStore;

abstract class NoteStoreBase with Store {
  @observable
  ObservableList<Note> _notes = ObservableList.of([]);

  @computed
  UnmodifiableListView<Note> get notes => UnmodifiableListView(notes);

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
}

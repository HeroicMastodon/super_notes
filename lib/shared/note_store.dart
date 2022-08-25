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

  Note getNoteById(String id) {
    return _notes.firstWhere((e) => e.id == id, orElse: () => Note(id));
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
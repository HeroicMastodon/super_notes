// ignore_for_file: prefer_final_fields

import 'dart:collection';

import 'package:mobx/mobx.dart';

import '../shared/note/note.dart';

part 'notes_list_view_model.g.dart';

class NotesListViewModel = NotesListViewModelBase with _$NotesListViewModel;

abstract class NotesListViewModelBase with Store {
  ObservableList<Note> _notes = ObservableList.of([]);

  @computed
  UnmodifiableListView<String> get noteIds =>
      UnmodifiableListView(_notes.map((e) => e.id));
}

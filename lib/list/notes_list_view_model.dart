// ignore_for_file: prefer_final_fields

import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:notes/setup.dart';
import 'package:notes/shared/store/note_store.dart';

part 'notes_list_view_model.g.dart';

class NotesListViewModel = NotesListViewModelBase with _$NotesListViewModel;

abstract class NotesListViewModelBase with Store {
  final _store = inject<NoteStore>();

  @computed
  UnmodifiableListView<String> get noteIds =>
      UnmodifiableListView(_store.notes.map((e) => e.id));
}

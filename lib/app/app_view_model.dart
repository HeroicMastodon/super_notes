import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:notes/setup.dart';
import 'package:notes/shared/commander/commander.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';
import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/store/note_store.dart';

part 'app_view_model.g.dart';

class AppViewModel = AppViewModelBase with _$AppViewModel;

abstract class AppViewModelBase with Store {
  final _store = inject<NoteStore>();
  final _commander = inject<Commander>();

  @computed
  UnmodifiableListView<Note> get _notes => UnmodifiableListView(_store.notes);

  @readonly
  String? _selectedNoteId;

  @computed
  Note? get _selectedNote =>
      _selectedNoteId == null
          ? null
          : _notes.firstWhere((e) => e.id == _selectedNoteId);

  @computed
  String get title => _selectedNote?.title ?? "Notes";

  @action
  Future<void> selectNote(String? id) async {
    _selectedNoteId = id;
  }

  Future createNote() async {
    await _commander.order(const CreateNote(title: ''));
  }
}

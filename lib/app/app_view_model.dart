import 'package:mobx/mobx.dart';
import 'package:notes/editor/editor_view_model.dart';
import 'package:notes/shared/note/note.dart';

part 'app_view_model.g.dart';

class AppViewModel = AppViewModelBase with _$AppViewModel;

abstract class AppViewModelBase with Store {
  final ObservableList<Note> _notes = ObservableList.of([]);

  @readonly
  String? _selectedNoteId;

  @computed
  Note? get _selectedNote => _selectedNoteId == null
      ? null
      : _notes.firstWhere((e) => e.id == _selectedNoteId);

  @computed
  String get title => _selectedNote?.title ?? "Notes";

  @action
  Future<void> selectNote(String? id) async {
    _selectedNoteId = id;
  }
}

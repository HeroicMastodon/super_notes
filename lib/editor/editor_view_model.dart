import 'package:mobx/mobx.dart';
import 'package:notes/setup.dart';
import 'package:notes/shared/commander/commander.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';
import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/queries/notes_queries.dart';

part 'editor_view_model.g.dart';

class EditorViewModel = EditorViewModelBase with _$EditorViewModel;

abstract class EditorViewModelBase with Store {
  EditorViewModelBase();

  final _commander = inject<Commander>();
  final _queries = inject<NotesQueries>();

  @readonly
  Note? _note;

  @computed
  String get title => _note?.title ?? "";

  @computed
  String get content => _note?.content ?? "";

  @computed
  bool get loading => _note == null;

  void changeTitle(String newTitle) {
    final command = UpdateNote(
      id: _note?.id ?? "",
      title: newTitle,
      content: content,
    );
    _commander.order(command);
  }

  void changeContent(String newContent) {
    final command = UpdateNote(
      id: _note?.id ?? "",
      title: title,
      content: newContent,
    );
    _commander.order(command);
  }

  @action
  Future<void> init(String id) async {
    _note = await _queries.getNoteById(id);
  }
}

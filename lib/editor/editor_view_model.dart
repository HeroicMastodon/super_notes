import 'package:mobx/mobx.dart';
import 'package:notes/setup.dart';
import 'package:notes/shared/commander/commander.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';
import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/store/note_store.dart';

part 'editor_view_model.g.dart';

class EditorViewModel = EditorViewModelBase with _$EditorViewModel;

abstract class EditorViewModelBase with Store {
  EditorViewModelBase(String id): _id = id;

  final String _id;
  final _commander = inject<Commander>();
  final _store = inject<NoteStore>();

  @computed
  Note? get _note => _store.getNoteById(_id);

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
}

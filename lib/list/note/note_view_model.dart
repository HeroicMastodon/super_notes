import 'package:mobx/mobx.dart';
import 'package:notes/setup.dart';
import 'package:notes/shared/commander/commander.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';
import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/queries/notes_queries.dart';

part 'note_view_model.g.dart';

class NoteViewModel = NoteViewModelBase with _$NoteViewModel;

abstract class NoteViewModelBase with Store {
  final _queries = inject<NotesQueries>();
  final _commander = inject<Commander>();

  NoteViewModelBase();

  @readonly
  Note? _note;

  @computed
  bool get loading => _note == null;

  @computed
  String get title => _note?.title ?? "";

  @computed
  String get dateCreated => _note?.dateCreated.toString() ?? "";

  void onDelete() {
    if (_note != null) _commander.order(DeleteNote(id: _note!.id));
  }

  @action
  Future<void> init(String id) async {
    _note = await _queries.getNoteById(id);
  }
}

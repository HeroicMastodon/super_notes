import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:notes/setup.dart';
import 'package:notes/shared/commander/commander.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';
import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/store/note_store.dart';

part 'note_view_model.g.dart';

class NoteViewModel = NoteViewModelBase with _$NoteViewModel;

abstract class NoteViewModelBase with Store {
  final _store = inject<NoteStore>();
  final _commander = inject<Commander>();

  NoteViewModelBase(this._id);

  final String _id;

  @computed
  Note? get _note => _store.getNoteById(_id);

  @computed
  bool get loading => _note == null;

  @computed
  String get title => _note?.title ?? "";

  @computed
  String get dateCreated {
    final date = _note?.dateCreated.toLocal();
    if (date == null) return "";

    final format = DateFormat("MMMM d, y");
    final formatted = format.format(date);

    return formatted;
  }

  void onDelete() {
    if (_note != null) _commander.order(DeleteNote(id: _note!.id));
  }
}

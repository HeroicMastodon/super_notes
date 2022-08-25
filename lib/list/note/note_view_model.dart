import 'package:mobx/mobx.dart';
import 'package:notes/shared/note/note.dart';

part 'note_view_model.g.dart';

class NoteViewModel = NoteViewModelBase with _$NoteViewModel;

abstract class NoteViewModelBase with Store {
  NoteViewModelBase(String id) : _note = Note(id);

  final Note _note;

  @computed
  String get title => _note.title;

  @computed
  String get dateCreated => _note.dateCreated.toString();
}

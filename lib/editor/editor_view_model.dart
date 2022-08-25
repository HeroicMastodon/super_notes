import 'package:mobx/mobx.dart';
import 'package:notes/shared/note/note.dart';

part 'editor_view_model.g.dart';

class EditorViewModel = EditorViewModelBase with _$EditorViewModel;

abstract class EditorViewModelBase with Store {
  EditorViewModelBase(String id): _note = Note(id);

  final Note _note;

  @computed
  String get title => _note.title;

  @computed
  String get content => _note.content;

  void changeTitle(String newTitle) {

  }

  void changeContent(String newContent) {

  }
}
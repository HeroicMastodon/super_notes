// ignore_for_file: prefer_final_fields

import 'package:mobx/mobx.dart';

part 'note.g.dart';

class Note = NoteBase with _$Note;

abstract class NoteBase with Store {
  NoteBase(
    this.id, [
    this.title = "",
    this.content = "",
    DateTime? dateCreated,
  ]) : _dateCreated = dateCreated ?? DateTime.now();

  @observable
  String title;

  @observable
  String id;

  @observable
  String content;

  @readonly
  DateTime _dateCreated;
}

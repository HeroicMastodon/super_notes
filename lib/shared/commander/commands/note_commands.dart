import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_commands.freezed.dart';

@freezed
class NoteCommand with _$NoteCommand {
  const factory NoteCommand.createNote({
    required String title,
    String? content,
  }) = CreateNote;

  const factory NoteCommand.deleteNote({
    required String id,
  }) = DeleteNote;
}

@freezed
class UpdateNote with _$UpdateNote {
  const factory UpdateNote.title({
    required String id,
    required String title,
  }) = _UpdateNoteTitle;

  const factory UpdateNote.content({
    required String id,
    required String? content,
  }) = _UpdateNoteContent;
}

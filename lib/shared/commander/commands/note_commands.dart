import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_commands.freezed.dart';

@freezed
class NoteCommand with _$NoteCommand {
  const factory NoteCommand.createNote({
    required String title,
    String? content,
  }) = CreateNote;

  const factory NoteCommand.updateNote({
    required String id,
    required String title,
    required String? content,
  }) = UpdateNote;

  const factory NoteCommand.deleteNote({
    required String id,
  }) = DeleteNote;
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'note_commands.freezed.dart';

@freezed
class NoteCommand with _$NoteCommand {
  const factory NoteCommand.createNote(String title, String? content) = CreateNote;
}

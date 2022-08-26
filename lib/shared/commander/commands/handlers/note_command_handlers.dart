import 'package:notes/setup.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';
import 'package:notes/shared/id_generator.dart';
import 'package:notes/shared/mapping/note_codec.dart';
import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/repository/notes_repository.dart';
import 'package:notes/shared/store/note_store.dart';

final _codec = NoteCodec();
final _repo = inject<NotesRepository>();
final _store = inject<NoteStore>();

void createNoteHandler(CreateNote command) async  {
  final note = Note(
    generateId(),
    command.title,
    command.content ?? "",
    DateTime.now(),
  );

  await _repo.upsertNote(_codec.encode(note));
  _store.addNote(note);
}

void updateNoteHandler(UpdateNote command) async {
  final note = _store.getNoteById(command.id);
  if (note == null) return;

  note.title = command.title;
  note.content = command.content ?? note.content;

  await _repo.upsertNote(_codec.encode(note));
}

void deleteNoteHandler(DeleteNote command) async {
  final note = _store.getNoteById(command.id);
  if (note == null) return;

  await _repo.deleteNote(_codec.encode(note));
  _store.deleteNote(note);
}

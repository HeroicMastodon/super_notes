import 'package:notes/setup.dart';
import 'package:notes/shared/mapping/note_codec.dart';
import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/repository/notes_repository.dart';
import 'package:notes/shared/store/note_store.dart';

// TODO: Make these queries repo only and use the store for hooking up to view models
class NotesQueries {
  final _repo = inject<NotesRepository>();
  final _store = inject<NoteStore>();
  final _codec = NoteCodec();

  Future<Note?> getNoteById(String id) async {
    final note = _store.getNoteById(id);
    if (note != null) return note;

    final entity = await _repo.getNoteById(id);
    return entity == null ? null : _codec.decoder.convert(entity);
  }

  Future<List<Note>> listNotes() async {
    final notes = _store.notes;
    if (notes.isNotEmpty) return notes;

    final entities = await _repo.listNotes();
    return entities.map((e) => _codec.decoder.convert(e)).toList();
  }
}
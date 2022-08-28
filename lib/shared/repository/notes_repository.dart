
import 'package:notes/setup.dart';
import 'package:notes/shared/note/note_entity.dart';
import 'package:sembast/sembast.dart';

abstract class NotesRepository {
  Future<NoteEntity?> getNoteById(String id);

  Future<List<NoteEntity>> listNotes();

  Future<NoteEntity?> upsertNote(NoteEntity note);

  Future<NoteEntity?> deleteNote(NoteEntity note);

  Future<bool> clear();

  Future<NoteEntity?> changeNoteTitle(String id, String title);

  Future<NoteEntity?> changeNoteContent(String id, String? content);
}

class NotesSembastRepository implements NotesRepository {
  final _db = inject<Database>();
  final _store = stringMapStoreFactory.store("notes_store");

  @override
  Future<bool> clear() async {
    final deleteCount = await _store.delete(_db);

    return deleteCount > 0;
  }

  @override
  Future<NoteEntity?> deleteNote(NoteEntity note) async {
    final removed = await _store.record(note.id).delete(_db);

    return removed == note.id ? note : null;
  }

  @override
  Future<NoteEntity?> getNoteById(String id) async {
    final record = await _store.record(id).get(_db);
    if (record == null) return null;

    return NoteEntity.fromJson(record);
  }

  @override
  Future<List<NoteEntity>> listNotes() async {
    final records = await _store.find(_db);
    final notes = records.map((e) => NoteEntity.fromJson(e.value));

    return notes.toList();
  }

  @override
  Future<NoteEntity?> upsertNote(NoteEntity note) async {
    final result = await _store.record(note.id).put(_db, note.toJson());

    return NoteEntity.fromJson(result);
  }

  @override
  Future<NoteEntity?> changeNoteContent(String id, String? content) async {
    NoteEntity? entity;
    await _db.transaction((transaction) async {
      final record = await _store.record(id).get(transaction);
      if (record == null) return null;
      entity = NoteEntity.fromJson(record).copyWith(content: content ?? "");
      await _store.record(id).put(transaction, entity!.toJson());
    });

    return entity;
  }

  @override
  Future<NoteEntity?> changeNoteTitle(String id, String title) async {
    NoteEntity? entity;
    await _db.transaction((transaction) async {
      final record = await _store.record(id).get(transaction);
      if (record == null) return null;
      entity = NoteEntity.fromJson(record).copyWith(title: title);
      await _store.record(id).put(transaction, entity!.toJson());
    });

    return entity;
  }
}

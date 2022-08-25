import 'dart:convert';

import 'package:notes/shared/note/note.dart';
import 'package:notes/shared/note/note_entity.dart';

class NoteCodec extends Codec<Note, NoteEntity> {
  @override
  Converter<NoteEntity, Note> get decoder => const _NoteDecoder();

  @override
  Converter<Note, NoteEntity> get encoder => const _NoteEncoder();
}

class _NoteEncoder extends Converter<Note, NoteEntity> {
  const _NoteEncoder();

  @override
  NoteEntity convert(Note input) {
    return NoteEntity(
      id: input.id,
      title: input.title,
      content: input.content,
      dateCreated: input.dateCreated,
    );
  }
}

class _NoteDecoder extends Converter<NoteEntity, Note> {
  const _NoteDecoder();

  @override
  Note convert(NoteEntity input) {
    return Note(
      input.id,
      input.title,
      input.content,
      input.dateCreated,
    );
  }
}

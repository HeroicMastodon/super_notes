// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_entity.freezed.dart';

part 'note_entity.g.dart';

@freezed
class NoteEntity with _$NoteEntity {
  const NoteEntity._();

  @JsonSerializable(explicitToJson: true)
  const factory NoteEntity({
    required String id,
    required String title,
    required String content,
    required String dateCreated,
  }) = _NoteEntity;

  factory NoteEntity.fromJson(Map<String, dynamic> json) =>
      _$NoteEntityFromJson(json);
}
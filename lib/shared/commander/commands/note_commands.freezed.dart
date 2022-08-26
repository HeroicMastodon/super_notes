// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_commands.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteCommand {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String? content) createNote,
    required TResult Function(String id, String title, String? content)
        updateNote,
    required TResult Function(String id) deleteNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    TResult Function(String id, String title, String? content)? updateNote,
    TResult Function(String id)? deleteNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    TResult Function(String id, String title, String? content)? updateNote,
    TResult Function(String id)? deleteNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(DeleteNote value) deleteNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(DeleteNote value)? deleteNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(DeleteNote value)? deleteNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCommandCopyWith<$Res> {
  factory $NoteCommandCopyWith(
          NoteCommand value, $Res Function(NoteCommand) then) =
      _$NoteCommandCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteCommandCopyWithImpl<$Res> implements $NoteCommandCopyWith<$Res> {
  _$NoteCommandCopyWithImpl(this._value, this._then);

  final NoteCommand _value;
  // ignore: unused_field
  final $Res Function(NoteCommand) _then;
}

/// @nodoc
abstract class _$$CreateNoteCopyWith<$Res> {
  factory _$$CreateNoteCopyWith(
          _$CreateNote value, $Res Function(_$CreateNote) then) =
      __$$CreateNoteCopyWithImpl<$Res>;
  $Res call({String title, String? content});
}

/// @nodoc
class __$$CreateNoteCopyWithImpl<$Res> extends _$NoteCommandCopyWithImpl<$Res>
    implements _$$CreateNoteCopyWith<$Res> {
  __$$CreateNoteCopyWithImpl(
      _$CreateNote _value, $Res Function(_$CreateNote) _then)
      : super(_value, (v) => _then(v as _$CreateNote));

  @override
  _$CreateNote get _value => super._value as _$CreateNote;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_$CreateNote(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateNote implements CreateNote {
  const _$CreateNote({required this.title, this.content});

  @override
  final String title;
  @override
  final String? content;

  @override
  String toString() {
    return 'NoteCommand.createNote(title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNote &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$CreateNoteCopyWith<_$CreateNote> get copyWith =>
      __$$CreateNoteCopyWithImpl<_$CreateNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String? content) createNote,
    required TResult Function(String id, String title, String? content)
        updateNote,
    required TResult Function(String id) deleteNote,
  }) {
    return createNote(title, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    TResult Function(String id, String title, String? content)? updateNote,
    TResult Function(String id)? deleteNote,
  }) {
    return createNote?.call(title, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    TResult Function(String id, String title, String? content)? updateNote,
    TResult Function(String id)? deleteNote,
    required TResult orElse(),
  }) {
    if (createNote != null) {
      return createNote(title, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(DeleteNote value) deleteNote,
  }) {
    return createNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(DeleteNote value)? deleteNote,
  }) {
    return createNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(DeleteNote value)? deleteNote,
    required TResult orElse(),
  }) {
    if (createNote != null) {
      return createNote(this);
    }
    return orElse();
  }
}

abstract class CreateNote implements NoteCommand {
  const factory CreateNote(
      {required final String title, final String? content}) = _$CreateNote;

  String get title;
  String? get content;
  @JsonKey(ignore: true)
  _$$CreateNoteCopyWith<_$CreateNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNoteCopyWith<$Res> {
  factory _$$UpdateNoteCopyWith(
          _$UpdateNote value, $Res Function(_$UpdateNote) then) =
      __$$UpdateNoteCopyWithImpl<$Res>;
  $Res call({String id, String title, String? content});
}

/// @nodoc
class __$$UpdateNoteCopyWithImpl<$Res> extends _$NoteCommandCopyWithImpl<$Res>
    implements _$$UpdateNoteCopyWith<$Res> {
  __$$UpdateNoteCopyWithImpl(
      _$UpdateNote _value, $Res Function(_$UpdateNote) _then)
      : super(_value, (v) => _then(v as _$UpdateNote));

  @override
  _$UpdateNote get _value => super._value as _$UpdateNote;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_$UpdateNote(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateNote implements UpdateNote {
  const _$UpdateNote(
      {required this.id, required this.title, required this.content});

  @override
  final String id;
  @override
  final String title;
  @override
  final String? content;

  @override
  String toString() {
    return 'NoteCommand.updateNote(id: $id, title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNote &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$UpdateNoteCopyWith<_$UpdateNote> get copyWith =>
      __$$UpdateNoteCopyWithImpl<_$UpdateNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String? content) createNote,
    required TResult Function(String id, String title, String? content)
        updateNote,
    required TResult Function(String id) deleteNote,
  }) {
    return updateNote(id, title, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    TResult Function(String id, String title, String? content)? updateNote,
    TResult Function(String id)? deleteNote,
  }) {
    return updateNote?.call(id, title, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    TResult Function(String id, String title, String? content)? updateNote,
    TResult Function(String id)? deleteNote,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(id, title, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(DeleteNote value) deleteNote,
  }) {
    return updateNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(DeleteNote value)? deleteNote,
  }) {
    return updateNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(DeleteNote value)? deleteNote,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(this);
    }
    return orElse();
  }
}

abstract class UpdateNote implements NoteCommand {
  const factory UpdateNote(
      {required final String id,
      required final String title,
      required final String? content}) = _$UpdateNote;

  String get id;
  String get title;
  String? get content;
  @JsonKey(ignore: true)
  _$$UpdateNoteCopyWith<_$UpdateNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteNoteCopyWith<$Res> {
  factory _$$DeleteNoteCopyWith(
          _$DeleteNote value, $Res Function(_$DeleteNote) then) =
      __$$DeleteNoteCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$DeleteNoteCopyWithImpl<$Res> extends _$NoteCommandCopyWithImpl<$Res>
    implements _$$DeleteNoteCopyWith<$Res> {
  __$$DeleteNoteCopyWithImpl(
      _$DeleteNote _value, $Res Function(_$DeleteNote) _then)
      : super(_value, (v) => _then(v as _$DeleteNote));

  @override
  _$DeleteNote get _value => super._value as _$DeleteNote;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$DeleteNote(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteNote implements DeleteNote {
  const _$DeleteNote({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'NoteCommand.deleteNote(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNote &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$DeleteNoteCopyWith<_$DeleteNote> get copyWith =>
      __$$DeleteNoteCopyWithImpl<_$DeleteNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String? content) createNote,
    required TResult Function(String id, String title, String? content)
        updateNote,
    required TResult Function(String id) deleteNote,
  }) {
    return deleteNote(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    TResult Function(String id, String title, String? content)? updateNote,
    TResult Function(String id)? deleteNote,
  }) {
    return deleteNote?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    TResult Function(String id, String title, String? content)? updateNote,
    TResult Function(String id)? deleteNote,
    required TResult orElse(),
  }) {
    if (deleteNote != null) {
      return deleteNote(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(DeleteNote value) deleteNote,
  }) {
    return deleteNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(DeleteNote value)? deleteNote,
  }) {
    return deleteNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(DeleteNote value)? deleteNote,
    required TResult orElse(),
  }) {
    if (deleteNote != null) {
      return deleteNote(this);
    }
    return orElse();
  }
}

abstract class DeleteNote implements NoteCommand {
  const factory DeleteNote({required final String id}) = _$DeleteNote;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteNoteCopyWith<_$DeleteNote> get copyWith =>
      throw _privateConstructorUsedError;
}

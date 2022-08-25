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
  String get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String? content) createNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteCommandCopyWith<NoteCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCommandCopyWith<$Res> {
  factory $NoteCommandCopyWith(
          NoteCommand value, $Res Function(NoteCommand) then) =
      _$NoteCommandCopyWithImpl<$Res>;
  $Res call({String title, String? content});
}

/// @nodoc
class _$NoteCommandCopyWithImpl<$Res> implements $NoteCommandCopyWith<$Res> {
  _$NoteCommandCopyWithImpl(this._value, this._then);

  final NoteCommand _value;
  // ignore: unused_field
  final $Res Function(NoteCommand) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$CreateNoteCopyWith<$Res>
    implements $NoteCommandCopyWith<$Res> {
  factory _$$CreateNoteCopyWith(
          _$CreateNote value, $Res Function(_$CreateNote) then) =
      __$$CreateNoteCopyWithImpl<$Res>;
  @override
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
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateNote implements CreateNote {
  const _$CreateNote(this.title, this.content);

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
  }) {
    return createNote(title, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
  }) {
    return createNote?.call(title, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String? content)? createNote,
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
  }) {
    return createNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
  }) {
    return createNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    required TResult orElse(),
  }) {
    if (createNote != null) {
      return createNote(this);
    }
    return orElse();
  }
}

abstract class CreateNote implements NoteCommand {
  const factory CreateNote(final String title, final String? content) =
      _$CreateNote;

  @override
  String get title;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$CreateNoteCopyWith<_$CreateNote> get copyWith =>
      throw _privateConstructorUsedError;
}

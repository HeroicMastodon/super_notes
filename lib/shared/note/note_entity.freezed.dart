// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteEntity _$NoteEntityFromJson(Map<String, dynamic> json) {
  return _NoteEntity.fromJson(json);
}

/// @nodoc
mixin _$NoteEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get dateCreated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteEntityCopyWith<NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteEntityCopyWith<$Res> {
  factory $NoteEntityCopyWith(
          NoteEntity value, $Res Function(NoteEntity) then) =
      _$NoteEntityCopyWithImpl<$Res>;
  $Res call({String id, String title, String content, DateTime dateCreated});
}

/// @nodoc
class _$NoteEntityCopyWithImpl<$Res> implements $NoteEntityCopyWith<$Res> {
  _$NoteEntityCopyWithImpl(this._value, this._then);

  final NoteEntity _value;
  // ignore: unused_field
  final $Res Function(NoteEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? dateCreated = freezed,
  }) {
    return _then(_value.copyWith(
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
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_NoteEntityCopyWith<$Res>
    implements $NoteEntityCopyWith<$Res> {
  factory _$$_NoteEntityCopyWith(
          _$_NoteEntity value, $Res Function(_$_NoteEntity) then) =
      __$$_NoteEntityCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, String content, DateTime dateCreated});
}

/// @nodoc
class __$$_NoteEntityCopyWithImpl<$Res> extends _$NoteEntityCopyWithImpl<$Res>
    implements _$$_NoteEntityCopyWith<$Res> {
  __$$_NoteEntityCopyWithImpl(
      _$_NoteEntity _value, $Res Function(_$_NoteEntity) _then)
      : super(_value, (v) => _then(v as _$_NoteEntity));

  @override
  _$_NoteEntity get _value => super._value as _$_NoteEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? dateCreated = freezed,
  }) {
    return _then(_$_NoteEntity(
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
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_NoteEntity extends _NoteEntity {
  const _$_NoteEntity(
      {required this.id,
      required this.title,
      required this.content,
      required this.dateCreated})
      : super._();

  factory _$_NoteEntity.fromJson(Map<String, dynamic> json) =>
      _$$_NoteEntityFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime dateCreated;

  @override
  String toString() {
    return 'NoteEntity(id: $id, title: $title, content: $content, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(dateCreated));

  @JsonKey(ignore: true)
  @override
  _$$_NoteEntityCopyWith<_$_NoteEntity> get copyWith =>
      __$$_NoteEntityCopyWithImpl<_$_NoteEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteEntityToJson(
      this,
    );
  }
}

abstract class _NoteEntity extends NoteEntity {
  const factory _NoteEntity(
      {required final String id,
      required final String title,
      required final String content,
      required final DateTime dateCreated}) = _$_NoteEntity;
  const _NoteEntity._() : super._();

  factory _NoteEntity.fromJson(Map<String, dynamic> json) =
      _$_NoteEntity.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get dateCreated;
  @override
  @JsonKey(ignore: true)
  _$$_NoteEntityCopyWith<_$_NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

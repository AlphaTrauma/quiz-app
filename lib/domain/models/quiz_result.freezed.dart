// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizResult {

 String get userId; String get category; int get correctAnswers; int get totalQuestions; DateTime get completedAt;
/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizResultCopyWith<QuizResult> get copyWith => _$QuizResultCopyWithImpl<QuizResult>(this as QuizResult, _$identity);

  /// Serializes this QuizResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizResult&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.category, category) || other.category == category)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,category,correctAnswers,totalQuestions,completedAt);

@override
String toString() {
  return 'QuizResult(userId: $userId, category: $category, correctAnswers: $correctAnswers, totalQuestions: $totalQuestions, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $QuizResultCopyWith<$Res>  {
  factory $QuizResultCopyWith(QuizResult value, $Res Function(QuizResult) _then) = _$QuizResultCopyWithImpl;
@useResult
$Res call({
 String userId, String category, int correctAnswers, int totalQuestions, DateTime completedAt
});




}
/// @nodoc
class _$QuizResultCopyWithImpl<$Res>
    implements $QuizResultCopyWith<$Res> {
  _$QuizResultCopyWithImpl(this._self, this._then);

  final QuizResult _self;
  final $Res Function(QuizResult) _then;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? category = null,Object? correctAnswers = null,Object? totalQuestions = null,Object? completedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizResult].
extension QuizResultPatterns on QuizResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizResult value)  $default,){
final _that = this;
switch (_that) {
case _QuizResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizResult value)?  $default,){
final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String category,  int correctAnswers,  int totalQuestions,  DateTime completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that.userId,_that.category,_that.correctAnswers,_that.totalQuestions,_that.completedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String category,  int correctAnswers,  int totalQuestions,  DateTime completedAt)  $default,) {final _that = this;
switch (_that) {
case _QuizResult():
return $default(_that.userId,_that.category,_that.correctAnswers,_that.totalQuestions,_that.completedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String category,  int correctAnswers,  int totalQuestions,  DateTime completedAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that.userId,_that.category,_that.correctAnswers,_that.totalQuestions,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizResult implements QuizResult {
  const _QuizResult({required this.userId, required this.category, required this.correctAnswers, required this.totalQuestions, required this.completedAt});
  factory _QuizResult.fromJson(Map<String, dynamic> json) => _$QuizResultFromJson(json);

@override final  String userId;
@override final  String category;
@override final  int correctAnswers;
@override final  int totalQuestions;
@override final  DateTime completedAt;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizResultCopyWith<_QuizResult> get copyWith => __$QuizResultCopyWithImpl<_QuizResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizResult&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.category, category) || other.category == category)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,category,correctAnswers,totalQuestions,completedAt);

@override
String toString() {
  return 'QuizResult(userId: $userId, category: $category, correctAnswers: $correctAnswers, totalQuestions: $totalQuestions, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$QuizResultCopyWith<$Res> implements $QuizResultCopyWith<$Res> {
  factory _$QuizResultCopyWith(_QuizResult value, $Res Function(_QuizResult) _then) = __$QuizResultCopyWithImpl;
@override @useResult
$Res call({
 String userId, String category, int correctAnswers, int totalQuestions, DateTime completedAt
});




}
/// @nodoc
class __$QuizResultCopyWithImpl<$Res>
    implements _$QuizResultCopyWith<$Res> {
  __$QuizResultCopyWithImpl(this._self, this._then);

  final _QuizResult _self;
  final $Res Function(_QuizResult) _then;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? category = null,Object? correctAnswers = null,Object? totalQuestions = null,Object? completedAt = null,}) {
  return _then(_QuizResult(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

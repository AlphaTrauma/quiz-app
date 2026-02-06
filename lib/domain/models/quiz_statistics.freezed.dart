// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizStatistics {

 int get totalQuizzes; int get totalCorrectAnswers; int get totalQuestions; int get bestScore;
/// Create a copy of QuizStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizStatisticsCopyWith<QuizStatistics> get copyWith => _$QuizStatisticsCopyWithImpl<QuizStatistics>(this as QuizStatistics, _$identity);

  /// Serializes this QuizStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizStatistics&&(identical(other.totalQuizzes, totalQuizzes) || other.totalQuizzes == totalQuizzes)&&(identical(other.totalCorrectAnswers, totalCorrectAnswers) || other.totalCorrectAnswers == totalCorrectAnswers)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.bestScore, bestScore) || other.bestScore == bestScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalQuizzes,totalCorrectAnswers,totalQuestions,bestScore);

@override
String toString() {
  return 'QuizStatistics(totalQuizzes: $totalQuizzes, totalCorrectAnswers: $totalCorrectAnswers, totalQuestions: $totalQuestions, bestScore: $bestScore)';
}


}

/// @nodoc
abstract mixin class $QuizStatisticsCopyWith<$Res>  {
  factory $QuizStatisticsCopyWith(QuizStatistics value, $Res Function(QuizStatistics) _then) = _$QuizStatisticsCopyWithImpl;
@useResult
$Res call({
 int totalQuizzes, int totalCorrectAnswers, int totalQuestions, int bestScore
});




}
/// @nodoc
class _$QuizStatisticsCopyWithImpl<$Res>
    implements $QuizStatisticsCopyWith<$Res> {
  _$QuizStatisticsCopyWithImpl(this._self, this._then);

  final QuizStatistics _self;
  final $Res Function(QuizStatistics) _then;

/// Create a copy of QuizStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalQuizzes = null,Object? totalCorrectAnswers = null,Object? totalQuestions = null,Object? bestScore = null,}) {
  return _then(_self.copyWith(
totalQuizzes: null == totalQuizzes ? _self.totalQuizzes : totalQuizzes // ignore: cast_nullable_to_non_nullable
as int,totalCorrectAnswers: null == totalCorrectAnswers ? _self.totalCorrectAnswers : totalCorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,bestScore: null == bestScore ? _self.bestScore : bestScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizStatistics].
extension QuizStatisticsPatterns on QuizStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizStatistics value)  $default,){
final _that = this;
switch (_that) {
case _QuizStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _QuizStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalQuizzes,  int totalCorrectAnswers,  int totalQuestions,  int bestScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizStatistics() when $default != null:
return $default(_that.totalQuizzes,_that.totalCorrectAnswers,_that.totalQuestions,_that.bestScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalQuizzes,  int totalCorrectAnswers,  int totalQuestions,  int bestScore)  $default,) {final _that = this;
switch (_that) {
case _QuizStatistics():
return $default(_that.totalQuizzes,_that.totalCorrectAnswers,_that.totalQuestions,_that.bestScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalQuizzes,  int totalCorrectAnswers,  int totalQuestions,  int bestScore)?  $default,) {final _that = this;
switch (_that) {
case _QuizStatistics() when $default != null:
return $default(_that.totalQuizzes,_that.totalCorrectAnswers,_that.totalQuestions,_that.bestScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizStatistics extends QuizStatistics {
  const _QuizStatistics({this.totalQuizzes = 0, this.totalCorrectAnswers = 0, this.totalQuestions = 0, this.bestScore = 0}): super._();
  factory _QuizStatistics.fromJson(Map<String, dynamic> json) => _$QuizStatisticsFromJson(json);

@override@JsonKey() final  int totalQuizzes;
@override@JsonKey() final  int totalCorrectAnswers;
@override@JsonKey() final  int totalQuestions;
@override@JsonKey() final  int bestScore;

/// Create a copy of QuizStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizStatisticsCopyWith<_QuizStatistics> get copyWith => __$QuizStatisticsCopyWithImpl<_QuizStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizStatistics&&(identical(other.totalQuizzes, totalQuizzes) || other.totalQuizzes == totalQuizzes)&&(identical(other.totalCorrectAnswers, totalCorrectAnswers) || other.totalCorrectAnswers == totalCorrectAnswers)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.bestScore, bestScore) || other.bestScore == bestScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalQuizzes,totalCorrectAnswers,totalQuestions,bestScore);

@override
String toString() {
  return 'QuizStatistics(totalQuizzes: $totalQuizzes, totalCorrectAnswers: $totalCorrectAnswers, totalQuestions: $totalQuestions, bestScore: $bestScore)';
}


}

/// @nodoc
abstract mixin class _$QuizStatisticsCopyWith<$Res> implements $QuizStatisticsCopyWith<$Res> {
  factory _$QuizStatisticsCopyWith(_QuizStatistics value, $Res Function(_QuizStatistics) _then) = __$QuizStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalQuizzes, int totalCorrectAnswers, int totalQuestions, int bestScore
});




}
/// @nodoc
class __$QuizStatisticsCopyWithImpl<$Res>
    implements _$QuizStatisticsCopyWith<$Res> {
  __$QuizStatisticsCopyWithImpl(this._self, this._then);

  final _QuizStatistics _self;
  final $Res Function(_QuizStatistics) _then;

/// Create a copy of QuizStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalQuizzes = null,Object? totalCorrectAnswers = null,Object? totalQuestions = null,Object? bestScore = null,}) {
  return _then(_QuizStatistics(
totalQuizzes: null == totalQuizzes ? _self.totalQuizzes : totalQuizzes // ignore: cast_nullable_to_non_nullable
as int,totalCorrectAnswers: null == totalCorrectAnswers ? _self.totalCorrectAnswers : totalCorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,bestScore: null == bestScore ? _self.bestScore : bestScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

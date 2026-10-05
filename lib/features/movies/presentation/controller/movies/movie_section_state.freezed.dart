// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_section_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieSectionState {

 List<Movie> get movies; RequestState get requestState; String get message;
/// Create a copy of MovieSectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieSectionStateCopyWith<MovieSectionState> get copyWith => _$MovieSectionStateCopyWithImpl<MovieSectionState>(this as MovieSectionState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MovieSectionState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieSectionState&&const DeepCollectionEquality().equals(other.movies, _this.movies)&&(identical(other.requestState, _this.requestState) || other.requestState == _this.requestState)&&(identical(other.message, _this.message) || other.message == _this.message));
}


@override
int get hashCode {
  final _this = this as MovieSectionState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.movies),_this.requestState,_this.message);
}

@override
String toString() {
  final _this = this as MovieSectionState;
  return 'MovieSectionState(movies: ${_this.movies}, requestState: ${_this.requestState}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $MovieSectionStateCopyWith<$Res>  {
  factory $MovieSectionStateCopyWith(MovieSectionState value, $Res Function(MovieSectionState) _then) = _$MovieSectionStateCopyWithImpl;
@useResult
$Res call({
 List<Movie> movies, RequestState requestState, String message
});




}
/// @nodoc
class _$MovieSectionStateCopyWithImpl<$Res>
    implements $MovieSectionStateCopyWith<$Res> {
  _$MovieSectionStateCopyWithImpl(this._self, this._then);

  final MovieSectionState _self;
  final $Res Function(MovieSectionState) _then;

/// Create a copy of MovieSectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movies = null,Object? requestState = null,Object? message = null,}) {
  return _then(MovieSectionState(
movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieSectionState].
extension MovieSectionStatePatterns on MovieSectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieSectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieSectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieSectionState value)  $default,){
final _that = this;
switch (_that) {
case _MovieSectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieSectionState value)?  $default,){
final _that = this;
switch (_that) {
case _MovieSectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Movie> movies,  RequestState requestState,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieSectionState() when $default != null:
return $default(_that.movies,_that.requestState,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Movie> movies,  RequestState requestState,  String message)  $default,) {final _that = this;
switch (_that) {
case _MovieSectionState():
return $default(_that.movies,_that.requestState,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Movie> movies,  RequestState requestState,  String message)?  $default,) {final _that = this;
switch (_that) {
case _MovieSectionState() when $default != null:
return $default(_that.movies,_that.requestState,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _MovieSectionState implements MovieSectionState {
  const _MovieSectionState({ List<Movie> movies = const <Movie>[], this.requestState = RequestState.loading, this.message = ''}): _movies = movies;
  

 final  List<Movie> _movies;
@override@JsonKey() List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}

@override@JsonKey() final  RequestState requestState;
@override@JsonKey() final  String message;

/// Create a copy of MovieSectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieSectionStateCopyWith<_MovieSectionState> get copyWith => __$MovieSectionStateCopyWithImpl<_MovieSectionState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieSectionState&&const DeepCollectionEquality().equals(other.movies, _movies)&&(identical(other.requestState, requestState) || other.requestState == requestState)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies),requestState,message);
}

@override
String toString() {
    return 'MovieSectionState(movies: $movies, requestState: $requestState, message: $message)';
}


}

/// @nodoc
abstract mixin class _$MovieSectionStateCopyWith<$Res> implements $MovieSectionStateCopyWith<$Res> {
  factory _$MovieSectionStateCopyWith(_MovieSectionState value, $Res Function(_MovieSectionState) _then) = __$MovieSectionStateCopyWithImpl;
@override @useResult
$Res call({
 List<Movie> movies, RequestState requestState, String message
});




}
/// @nodoc
class __$MovieSectionStateCopyWithImpl<$Res>
    implements _$MovieSectionStateCopyWith<$Res> {
  __$MovieSectionStateCopyWithImpl(this._self, this._then);

  final _MovieSectionState _self;
  final $Res Function(_MovieSectionState) _then;

/// Create a copy of MovieSectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movies = null,Object? requestState = null,Object? message = null,}) {
  return _then(_MovieSectionState(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

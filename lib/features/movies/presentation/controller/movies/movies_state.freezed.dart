// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoviesState {

 MovieSectionState get nowPlaying; MovieSectionState get popular; MovieSectionState get topRated;
/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoviesStateCopyWith<MoviesState> get copyWith => _$MoviesStateCopyWithImpl<MoviesState>(this as MoviesState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MoviesState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesState&&(identical(other.nowPlaying, _this.nowPlaying) || other.nowPlaying == _this.nowPlaying)&&(identical(other.popular, _this.popular) || other.popular == _this.popular)&&(identical(other.topRated, _this.topRated) || other.topRated == _this.topRated));
}


@override
int get hashCode {
  final _this = this as MoviesState;
  return Object.hash(runtimeType,_this.nowPlaying,_this.popular,_this.topRated);
}

@override
String toString() {
  final _this = this as MoviesState;
  return 'MoviesState(nowPlaying: ${_this.nowPlaying}, popular: ${_this.popular}, topRated: ${_this.topRated})';
}


}

/// @nodoc
abstract mixin class $MoviesStateCopyWith<$Res>  {
  factory $MoviesStateCopyWith(MoviesState value, $Res Function(MoviesState) _then) = _$MoviesStateCopyWithImpl;
@useResult
$Res call({
 MovieSectionState nowPlaying, MovieSectionState popular, MovieSectionState topRated
});


$MovieSectionStateCopyWith<$Res> get nowPlaying;$MovieSectionStateCopyWith<$Res> get popular;$MovieSectionStateCopyWith<$Res> get topRated;

}
/// @nodoc
class _$MoviesStateCopyWithImpl<$Res>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._self, this._then);

  final MoviesState _self;
  final $Res Function(MoviesState) _then;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nowPlaying = null,Object? popular = null,Object? topRated = null,}) {
  return _then(MoviesState(
nowPlaying: null == nowPlaying ? _self.nowPlaying : nowPlaying // ignore: cast_nullable_to_non_nullable
as MovieSectionState,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as MovieSectionState,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as MovieSectionState,
  ));
}
/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionStateCopyWith<$Res> get nowPlaying {
  
  return $MovieSectionStateCopyWith<$Res>(_self.nowPlaying, (value) {
    return _then(_self.copyWith(nowPlaying: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionStateCopyWith<$Res> get popular {
  
  return $MovieSectionStateCopyWith<$Res>(_self.popular, (value) {
    return _then(_self.copyWith(popular: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionStateCopyWith<$Res> get topRated {
  
  return $MovieSectionStateCopyWith<$Res>(_self.topRated, (value) {
    return _then(_self.copyWith(topRated: value));
  });
}
}


/// Adds pattern-matching-related methods to [MoviesState].
extension MoviesStatePatterns on MoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoviesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoviesState value)  $default,){
final _that = this;
switch (_that) {
case _MoviesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoviesState value)?  $default,){
final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MovieSectionState nowPlaying,  MovieSectionState popular,  MovieSectionState topRated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that.nowPlaying,_that.popular,_that.topRated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MovieSectionState nowPlaying,  MovieSectionState popular,  MovieSectionState topRated)  $default,) {final _that = this;
switch (_that) {
case _MoviesState():
return $default(_that.nowPlaying,_that.popular,_that.topRated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MovieSectionState nowPlaying,  MovieSectionState popular,  MovieSectionState topRated)?  $default,) {final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that.nowPlaying,_that.popular,_that.topRated);case _:
  return null;

}
}

}

/// @nodoc


class _MoviesState implements MoviesState {
  const _MoviesState({this.nowPlaying = const MovieSectionState(), this.popular = const MovieSectionState(), this.topRated = const MovieSectionState()});
  

@override@JsonKey() final  MovieSectionState nowPlaying;
@override@JsonKey() final  MovieSectionState popular;
@override@JsonKey() final  MovieSectionState topRated;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoviesStateCopyWith<_MoviesState> get copyWith => __$MoviesStateCopyWithImpl<_MoviesState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoviesState&&(identical(other.nowPlaying, nowPlaying) || other.nowPlaying == nowPlaying)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.topRated, topRated) || other.topRated == topRated));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nowPlaying,popular,topRated);
}

@override
String toString() {
    return 'MoviesState(nowPlaying: $nowPlaying, popular: $popular, topRated: $topRated)';
}


}

/// @nodoc
abstract mixin class _$MoviesStateCopyWith<$Res> implements $MoviesStateCopyWith<$Res> {
  factory _$MoviesStateCopyWith(_MoviesState value, $Res Function(_MoviesState) _then) = __$MoviesStateCopyWithImpl;
@override @useResult
$Res call({
 MovieSectionState nowPlaying, MovieSectionState popular, MovieSectionState topRated
});


@override $MovieSectionStateCopyWith<$Res> get nowPlaying;@override $MovieSectionStateCopyWith<$Res> get popular;@override $MovieSectionStateCopyWith<$Res> get topRated;

}
/// @nodoc
class __$MoviesStateCopyWithImpl<$Res>
    implements _$MoviesStateCopyWith<$Res> {
  __$MoviesStateCopyWithImpl(this._self, this._then);

  final _MoviesState _self;
  final $Res Function(_MoviesState) _then;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nowPlaying = null,Object? popular = null,Object? topRated = null,}) {
  return _then(_MoviesState(
nowPlaying: null == nowPlaying ? _self.nowPlaying : nowPlaying // ignore: cast_nullable_to_non_nullable
as MovieSectionState,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as MovieSectionState,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as MovieSectionState,
  ));
}

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionStateCopyWith<$Res> get nowPlaying {
  
  return $MovieSectionStateCopyWith<$Res>(_self.nowPlaying, (value) {
    return _then(_self.copyWith(nowPlaying: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionStateCopyWith<$Res> get popular {
  
  return $MovieSectionStateCopyWith<$Res>(_self.popular, (value) {
    return _then(_self.copyWith(popular: value));
  });
}/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieSectionStateCopyWith<$Res> get topRated {
  
  return $MovieSectionStateCopyWith<$Res>(_self.topRated, (value) {
    return _then(_self.copyWith(topRated: value));
  });
}
}

// dart format on

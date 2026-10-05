// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailState {

 MovieDetail? get movieDetail; RequestState get movieDetailState; String get movieDetailMessage; bool get isFavorite; bool get isFavoriteUpdating; String get favoriteMessage;
/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailStateCopyWith<MovieDetailState> get copyWith => _$MovieDetailStateCopyWithImpl<MovieDetailState>(this as MovieDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MovieDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailState&&(identical(other.movieDetail, _this.movieDetail) || other.movieDetail == _this.movieDetail)&&(identical(other.movieDetailState, _this.movieDetailState) || other.movieDetailState == _this.movieDetailState)&&(identical(other.movieDetailMessage, _this.movieDetailMessage) || other.movieDetailMessage == _this.movieDetailMessage)&&(identical(other.isFavorite, _this.isFavorite) || other.isFavorite == _this.isFavorite)&&(identical(other.isFavoriteUpdating, _this.isFavoriteUpdating) || other.isFavoriteUpdating == _this.isFavoriteUpdating)&&(identical(other.favoriteMessage, _this.favoriteMessage) || other.favoriteMessage == _this.favoriteMessage));
}


@override
int get hashCode {
  final _this = this as MovieDetailState;
  return Object.hash(runtimeType,_this.movieDetail,_this.movieDetailState,_this.movieDetailMessage,_this.isFavorite,_this.isFavoriteUpdating,_this.favoriteMessage);
}

@override
String toString() {
  final _this = this as MovieDetailState;
  return 'MovieDetailState(movieDetail: ${_this.movieDetail}, movieDetailState: ${_this.movieDetailState}, movieDetailMessage: ${_this.movieDetailMessage}, isFavorite: ${_this.isFavorite}, isFavoriteUpdating: ${_this.isFavoriteUpdating}, favoriteMessage: ${_this.favoriteMessage})';
}


}

/// @nodoc
abstract mixin class $MovieDetailStateCopyWith<$Res>  {
  factory $MovieDetailStateCopyWith(MovieDetailState value, $Res Function(MovieDetailState) _then) = _$MovieDetailStateCopyWithImpl;
@useResult
$Res call({
 MovieDetail? movieDetail, RequestState movieDetailState, String movieDetailMessage, bool isFavorite, bool isFavoriteUpdating, String favoriteMessage
});




}
/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._self, this._then);

  final MovieDetailState _self;
  final $Res Function(MovieDetailState) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieDetail = freezed,Object? movieDetailState = null,Object? movieDetailMessage = null,Object? isFavorite = null,Object? isFavoriteUpdating = null,Object? favoriteMessage = null,}) {
  return _then(MovieDetailState(
movieDetail: freezed == movieDetail ? _self.movieDetail : movieDetail // ignore: cast_nullable_to_non_nullable
as MovieDetail?,movieDetailState: null == movieDetailState ? _self.movieDetailState : movieDetailState // ignore: cast_nullable_to_non_nullable
as RequestState,movieDetailMessage: null == movieDetailMessage ? _self.movieDetailMessage : movieDetailMessage // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isFavoriteUpdating: null == isFavoriteUpdating ? _self.isFavoriteUpdating : isFavoriteUpdating // ignore: cast_nullable_to_non_nullable
as bool,favoriteMessage: null == favoriteMessage ? _self.favoriteMessage : favoriteMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailState].
extension MovieDetailStatePatterns on MovieDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailState value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MovieDetail? movieDetail,  RequestState movieDetailState,  String movieDetailMessage,  bool isFavorite,  bool isFavoriteUpdating,  String favoriteMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailState() when $default != null:
return $default(_that.movieDetail,_that.movieDetailState,_that.movieDetailMessage,_that.isFavorite,_that.isFavoriteUpdating,_that.favoriteMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MovieDetail? movieDetail,  RequestState movieDetailState,  String movieDetailMessage,  bool isFavorite,  bool isFavoriteUpdating,  String favoriteMessage)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailState():
return $default(_that.movieDetail,_that.movieDetailState,_that.movieDetailMessage,_that.isFavorite,_that.isFavoriteUpdating,_that.favoriteMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MovieDetail? movieDetail,  RequestState movieDetailState,  String movieDetailMessage,  bool isFavorite,  bool isFavoriteUpdating,  String favoriteMessage)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailState() when $default != null:
return $default(_that.movieDetail,_that.movieDetailState,_that.movieDetailMessage,_that.isFavorite,_that.isFavoriteUpdating,_that.favoriteMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MovieDetailState implements MovieDetailState {
  const _MovieDetailState({this.movieDetail, this.movieDetailState = RequestState.loading, this.movieDetailMessage = '', this.isFavorite = false, this.isFavoriteUpdating = false, this.favoriteMessage = ''});
  

@override final  MovieDetail? movieDetail;
@override@JsonKey() final  RequestState movieDetailState;
@override@JsonKey() final  String movieDetailMessage;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  bool isFavoriteUpdating;
@override@JsonKey() final  String favoriteMessage;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailStateCopyWith<_MovieDetailState> get copyWith => __$MovieDetailStateCopyWithImpl<_MovieDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailState&&(identical(other.movieDetail, movieDetail) || other.movieDetail == movieDetail)&&(identical(other.movieDetailState, movieDetailState) || other.movieDetailState == movieDetailState)&&(identical(other.movieDetailMessage, movieDetailMessage) || other.movieDetailMessage == movieDetailMessage)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isFavoriteUpdating, isFavoriteUpdating) || other.isFavoriteUpdating == isFavoriteUpdating)&&(identical(other.favoriteMessage, favoriteMessage) || other.favoriteMessage == favoriteMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,movieDetail,movieDetailState,movieDetailMessage,isFavorite,isFavoriteUpdating,favoriteMessage);
}

@override
String toString() {
    return 'MovieDetailState(movieDetail: $movieDetail, movieDetailState: $movieDetailState, movieDetailMessage: $movieDetailMessage, isFavorite: $isFavorite, isFavoriteUpdating: $isFavoriteUpdating, favoriteMessage: $favoriteMessage)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailStateCopyWith<$Res> implements $MovieDetailStateCopyWith<$Res> {
  factory _$MovieDetailStateCopyWith(_MovieDetailState value, $Res Function(_MovieDetailState) _then) = __$MovieDetailStateCopyWithImpl;
@override @useResult
$Res call({
 MovieDetail? movieDetail, RequestState movieDetailState, String movieDetailMessage, bool isFavorite, bool isFavoriteUpdating, String favoriteMessage
});




}
/// @nodoc
class __$MovieDetailStateCopyWithImpl<$Res>
    implements _$MovieDetailStateCopyWith<$Res> {
  __$MovieDetailStateCopyWithImpl(this._self, this._then);

  final _MovieDetailState _self;
  final $Res Function(_MovieDetailState) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieDetail = freezed,Object? movieDetailState = null,Object? movieDetailMessage = null,Object? isFavorite = null,Object? isFavoriteUpdating = null,Object? favoriteMessage = null,}) {
  return _then(_MovieDetailState(
movieDetail: freezed == movieDetail ? _self.movieDetail : movieDetail // ignore: cast_nullable_to_non_nullable
as MovieDetail?,movieDetailState: null == movieDetailState ? _self.movieDetailState : movieDetailState // ignore: cast_nullable_to_non_nullable
as RequestState,movieDetailMessage: null == movieDetailMessage ? _self.movieDetailMessage : movieDetailMessage // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isFavoriteUpdating: null == isFavoriteUpdating ? _self.isFavoriteUpdating : isFavoriteUpdating // ignore: cast_nullable_to_non_nullable
as bool,favoriteMessage: null == favoriteMessage ? _self.favoriteMessage : favoriteMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

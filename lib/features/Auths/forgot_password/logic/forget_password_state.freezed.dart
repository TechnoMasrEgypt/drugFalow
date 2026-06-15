// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgetPassState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPassState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPassState()';
}


}

/// @nodoc
class $ForgetPassStateCopyWith<$Res>  {
$ForgetPassStateCopyWith(ForgetPassState _, $Res Function(ForgetPassState) __);
}


/// Adds pattern-matching-related methods to [ForgetPassState].
extension ForgetPassStatePatterns on ForgetPassState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _ForgetSuccess value)?  ForgetSuccess,TResult Function( _Error value)?  error,TResult Function( _ResetPasswordSuccess value)?  resetPasswordSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ForgetSuccess() when ForgetSuccess != null:
return ForgetSuccess(_that);case _Error() when error != null:
return error(_that);case _ResetPasswordSuccess() when resetPasswordSuccess != null:
return resetPasswordSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _ForgetSuccess value)  ForgetSuccess,required TResult Function( _Error value)  error,required TResult Function( _ResetPasswordSuccess value)  resetPasswordSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _ForgetSuccess():
return ForgetSuccess(_that);case _Error():
return error(_that);case _ResetPasswordSuccess():
return resetPasswordSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _ForgetSuccess value)?  ForgetSuccess,TResult? Function( _Error value)?  error,TResult? Function( _ResetPasswordSuccess value)?  resetPasswordSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ForgetSuccess() when ForgetSuccess != null:
return ForgetSuccess(_that);case _Error() when error != null:
return error(_that);case _ResetPasswordSuccess() when resetPasswordSuccess != null:
return resetPasswordSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ForgetResponseModel response)?  ForgetSuccess,TResult Function( String message)?  error,TResult Function( ResetPasswordResponse response)?  resetPasswordSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ForgetSuccess() when ForgetSuccess != null:
return ForgetSuccess(_that.response);case _Error() when error != null:
return error(_that.message);case _ResetPasswordSuccess() when resetPasswordSuccess != null:
return resetPasswordSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ForgetResponseModel response)  ForgetSuccess,required TResult Function( String message)  error,required TResult Function( ResetPasswordResponse response)  resetPasswordSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _ForgetSuccess():
return ForgetSuccess(_that.response);case _Error():
return error(_that.message);case _ResetPasswordSuccess():
return resetPasswordSuccess(_that.response);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ForgetResponseModel response)?  ForgetSuccess,TResult? Function( String message)?  error,TResult? Function( ResetPasswordResponse response)?  resetPasswordSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ForgetSuccess() when ForgetSuccess != null:
return ForgetSuccess(_that.response);case _Error() when error != null:
return error(_that.message);case _ResetPasswordSuccess() when resetPasswordSuccess != null:
return resetPasswordSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ForgetPassState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPassState.initial()';
}


}




/// @nodoc


class _Loading implements ForgetPassState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPassState.loading()';
}


}




/// @nodoc


class _ForgetSuccess implements ForgetPassState {
  const _ForgetSuccess(this.response);
  

 final  ForgetResponseModel response;

/// Create a copy of ForgetPassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgetSuccessCopyWith<_ForgetSuccess> get copyWith => __$ForgetSuccessCopyWithImpl<_ForgetSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgetSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ForgetPassState.ForgetSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$ForgetSuccessCopyWith<$Res> implements $ForgetPassStateCopyWith<$Res> {
  factory _$ForgetSuccessCopyWith(_ForgetSuccess value, $Res Function(_ForgetSuccess) _then) = __$ForgetSuccessCopyWithImpl;
@useResult
$Res call({
 ForgetResponseModel response
});




}
/// @nodoc
class __$ForgetSuccessCopyWithImpl<$Res>
    implements _$ForgetSuccessCopyWith<$Res> {
  __$ForgetSuccessCopyWithImpl(this._self, this._then);

  final _ForgetSuccess _self;
  final $Res Function(_ForgetSuccess) _then;

/// Create a copy of ForgetPassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_ForgetSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ForgetResponseModel,
  ));
}


}

/// @nodoc


class _Error implements ForgetPassState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of ForgetPassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgetPassState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ForgetPassStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ForgetPassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResetPasswordSuccess implements ForgetPassState {
  const _ResetPasswordSuccess(this.response);
  

 final  ResetPasswordResponse response;

/// Create a copy of ForgetPassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordSuccessCopyWith<_ResetPasswordSuccess> get copyWith => __$ResetPasswordSuccessCopyWithImpl<_ResetPasswordSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ForgetPassState.resetPasswordSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordSuccessCopyWith<$Res> implements $ForgetPassStateCopyWith<$Res> {
  factory _$ResetPasswordSuccessCopyWith(_ResetPasswordSuccess value, $Res Function(_ResetPasswordSuccess) _then) = __$ResetPasswordSuccessCopyWithImpl;
@useResult
$Res call({
 ResetPasswordResponse response
});




}
/// @nodoc
class __$ResetPasswordSuccessCopyWithImpl<$Res>
    implements _$ResetPasswordSuccessCopyWith<$Res> {
  __$ResetPasswordSuccessCopyWithImpl(this._self, this._then);

  final _ResetPasswordSuccess _self;
  final $Res Function(_ResetPasswordSuccess) _then;

/// Create a copy of ForgetPassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_ResetPasswordSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ResetPasswordResponse,
  ));
}


}

// dart format on

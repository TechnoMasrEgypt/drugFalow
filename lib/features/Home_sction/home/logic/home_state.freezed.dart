// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WarehouseState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarehouseState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarehouseState()';
}


}

/// @nodoc
class $WarehouseStateCopyWith<$Res>  {
$WarehouseStateCopyWith(WarehouseState _, $Res Function(WarehouseState) __);
}


/// Adds pattern-matching-related methods to [WarehouseState].
extension WarehouseStatePatterns on WarehouseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,TResult Function( _DetailsLoading value)?  detailsStateloading,TResult Function( _DetailsSuccess value)?  detailsStatesuccess,TResult Function( _DetailsError value)?  detailsStateerror,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _DetailsLoading() when detailsStateloading != null:
return detailsStateloading(_that);case _DetailsSuccess() when detailsStatesuccess != null:
return detailsStatesuccess(_that);case _DetailsError() when detailsStateerror != null:
return detailsStateerror(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,required TResult Function( _DetailsLoading value)  detailsStateloading,required TResult Function( _DetailsSuccess value)  detailsStatesuccess,required TResult Function( _DetailsError value)  detailsStateerror,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _DetailsLoading():
return detailsStateloading(_that);case _DetailsSuccess():
return detailsStatesuccess(_that);case _DetailsError():
return detailsStateerror(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,TResult? Function( _DetailsLoading value)?  detailsStateloading,TResult? Function( _DetailsSuccess value)?  detailsStatesuccess,TResult? Function( _DetailsError value)?  detailsStateerror,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _DetailsLoading() when detailsStateloading != null:
return detailsStateloading(_that);case _DetailsSuccess() when detailsStatesuccess != null:
return detailsStatesuccess(_that);case _DetailsError() when detailsStateerror != null:
return detailsStateerror(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<WarehouseItem?>? warehouses)?  success,TResult Function( ErrorHandler error)?  error,TResult Function()?  detailsStateloading,TResult Function( WarehouseDetailsResponse? warehouses)?  detailsStatesuccess,TResult Function( ErrorHandler error)?  detailsStateerror,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.warehouses);case _Error() when error != null:
return error(_that.error);case _DetailsLoading() when detailsStateloading != null:
return detailsStateloading();case _DetailsSuccess() when detailsStatesuccess != null:
return detailsStatesuccess(_that.warehouses);case _DetailsError() when detailsStateerror != null:
return detailsStateerror(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<WarehouseItem?>? warehouses)  success,required TResult Function( ErrorHandler error)  error,required TResult Function()  detailsStateloading,required TResult Function( WarehouseDetailsResponse? warehouses)  detailsStatesuccess,required TResult Function( ErrorHandler error)  detailsStateerror,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.warehouses);case _Error():
return error(_that.error);case _DetailsLoading():
return detailsStateloading();case _DetailsSuccess():
return detailsStatesuccess(_that.warehouses);case _DetailsError():
return detailsStateerror(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<WarehouseItem?>? warehouses)?  success,TResult? Function( ErrorHandler error)?  error,TResult? Function()?  detailsStateloading,TResult? Function( WarehouseDetailsResponse? warehouses)?  detailsStatesuccess,TResult? Function( ErrorHandler error)?  detailsStateerror,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.warehouses);case _Error() when error != null:
return error(_that.error);case _DetailsLoading() when detailsStateloading != null:
return detailsStateloading();case _DetailsSuccess() when detailsStatesuccess != null:
return detailsStatesuccess(_that.warehouses);case _DetailsError() when detailsStateerror != null:
return detailsStateerror(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements WarehouseState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarehouseState.initial()';
}


}




/// @nodoc


class _Loading implements WarehouseState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarehouseState.loading()';
}


}




/// @nodoc


class _Success implements WarehouseState {
  const _Success(final  List<WarehouseItem?>? warehouses): _warehouses = warehouses;
  

 final  List<WarehouseItem?>? _warehouses;
 List<WarehouseItem?>? get warehouses {
  final value = _warehouses;
  if (value == null) return null;
  if (_warehouses is EqualUnmodifiableListView) return _warehouses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WarehouseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._warehouses, _warehouses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_warehouses));

@override
String toString() {
  return 'WarehouseState.success(warehouses: $warehouses)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $WarehouseStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<WarehouseItem?>? warehouses
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of WarehouseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warehouses = freezed,}) {
  return _then(_Success(
freezed == warehouses ? _self._warehouses : warehouses // ignore: cast_nullable_to_non_nullable
as List<WarehouseItem?>?,
  ));
}


}

/// @nodoc


class _Error implements WarehouseState {
  const _Error({required this.error});
  

 final  ErrorHandler error;

/// Create a copy of WarehouseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'WarehouseState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $WarehouseStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of WarehouseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

/// @nodoc


class _DetailsLoading implements WarehouseState {
  const _DetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarehouseState.detailsStateloading()';
}


}




/// @nodoc


class _DetailsSuccess implements WarehouseState {
  const _DetailsSuccess(this.warehouses);
  

 final  WarehouseDetailsResponse? warehouses;

/// Create a copy of WarehouseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailsSuccessCopyWith<_DetailsSuccess> get copyWith => __$DetailsSuccessCopyWithImpl<_DetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailsSuccess&&(identical(other.warehouses, warehouses) || other.warehouses == warehouses));
}


@override
int get hashCode => Object.hash(runtimeType,warehouses);

@override
String toString() {
  return 'WarehouseState.detailsStatesuccess(warehouses: $warehouses)';
}


}

/// @nodoc
abstract mixin class _$DetailsSuccessCopyWith<$Res> implements $WarehouseStateCopyWith<$Res> {
  factory _$DetailsSuccessCopyWith(_DetailsSuccess value, $Res Function(_DetailsSuccess) _then) = __$DetailsSuccessCopyWithImpl;
@useResult
$Res call({
 WarehouseDetailsResponse? warehouses
});




}
/// @nodoc
class __$DetailsSuccessCopyWithImpl<$Res>
    implements _$DetailsSuccessCopyWith<$Res> {
  __$DetailsSuccessCopyWithImpl(this._self, this._then);

  final _DetailsSuccess _self;
  final $Res Function(_DetailsSuccess) _then;

/// Create a copy of WarehouseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warehouses = freezed,}) {
  return _then(_DetailsSuccess(
freezed == warehouses ? _self.warehouses : warehouses // ignore: cast_nullable_to_non_nullable
as WarehouseDetailsResponse?,
  ));
}


}

/// @nodoc


class _DetailsError implements WarehouseState {
  const _DetailsError({required this.error});
  

 final  ErrorHandler error;

/// Create a copy of WarehouseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailsErrorCopyWith<_DetailsError> get copyWith => __$DetailsErrorCopyWithImpl<_DetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'WarehouseState.detailsStateerror(error: $error)';
}


}

/// @nodoc
abstract mixin class _$DetailsErrorCopyWith<$Res> implements $WarehouseStateCopyWith<$Res> {
  factory _$DetailsErrorCopyWith(_DetailsError value, $Res Function(_DetailsError) _then) = __$DetailsErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class __$DetailsErrorCopyWithImpl<$Res>
    implements _$DetailsErrorCopyWith<$Res> {
  __$DetailsErrorCopyWithImpl(this._self, this._then);

  final _DetailsError _self;
  final $Res Function(_DetailsError) _then;

/// Create a copy of WarehouseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_DetailsError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

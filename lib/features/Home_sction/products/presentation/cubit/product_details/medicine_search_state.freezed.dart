// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MedicineSearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicineSearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MedicineSearchState()';
}


}

/// @nodoc
class $MedicineSearchStateCopyWith<$Res>  {
$MedicineSearchStateCopyWith(MedicineSearchState _, $Res Function(MedicineSearchState) __);
}


/// Adds pattern-matching-related methods to [MedicineSearchState].
extension MedicineSearchStatePatterns on MedicineSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle value)?  idle,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( _Empty value)?  empty,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case _Empty() when empty != null:
return empty(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle value)  idle,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( _Empty value)  empty,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case Loading():
return loading(_that);case Success():
return success(_that);case _Empty():
return empty(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle value)?  idle,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( _Empty value)?  empty,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case _Empty() when empty != null:
return empty(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( List<SearchProductModel> results,  List<SearchWarehouse> warehouse)?  success,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.results,_that.warehouse);case _Empty() when empty != null:
return empty();case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( List<SearchProductModel> results,  List<SearchWarehouse> warehouse)  success,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case Loading():
return loading();case Success():
return success(_that.results,_that.warehouse);case _Empty():
return empty();case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( List<SearchProductModel> results,  List<SearchWarehouse> warehouse)?  success,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.results,_that.warehouse);case _Empty() when empty != null:
return empty();case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Idle implements MedicineSearchState {
  const Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MedicineSearchState.idle()';
}


}




/// @nodoc


class Loading implements MedicineSearchState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MedicineSearchState.loading()';
}


}




/// @nodoc


class Success implements MedicineSearchState {
  const Success({required final  List<SearchProductModel> results, required final  List<SearchWarehouse> warehouse}): _results = results,_warehouse = warehouse;
  

 final  List<SearchProductModel> _results;
 List<SearchProductModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  List<SearchWarehouse> _warehouse;
 List<SearchWarehouse> get warehouse {
  if (_warehouse is EqualUnmodifiableListView) return _warehouse;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warehouse);
}


/// Create a copy of MedicineSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&const DeepCollectionEquality().equals(other._results, _results)&&const DeepCollectionEquality().equals(other._warehouse, _warehouse));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_warehouse));

@override
String toString() {
  return 'MedicineSearchState.success(results: $results, warehouse: $warehouse)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $MedicineSearchStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 List<SearchProductModel> results, List<SearchWarehouse> warehouse
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of MedicineSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,Object? warehouse = null,}) {
  return _then(Success(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SearchProductModel>,warehouse: null == warehouse ? _self._warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as List<SearchWarehouse>,
  ));
}


}

/// @nodoc


class _Empty implements MedicineSearchState {
  const _Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MedicineSearchState.empty()';
}


}




/// @nodoc


class _Error implements MedicineSearchState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of MedicineSearchState
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
  return 'MedicineSearchState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MedicineSearchStateCopyWith<$Res> {
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

/// Create a copy of MedicineSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

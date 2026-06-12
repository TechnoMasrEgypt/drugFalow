// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterState()';
}


}

/// @nodoc
class $FilterStateCopyWith<$Res>  {
$FilterStateCopyWith(FilterState _, $Res Function(FilterState) __);
}


/// Adds pattern-matching-related methods to [FilterState].
extension FilterStatePatterns on FilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( _MedicinesLoaded value)?  medicinesLoaded,TResult Function( _IngredientsLoaded value)?  ingredientsLoaded,TResult Function( FiltersApplied value)?  filtersApplied,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case _MedicinesLoaded() when medicinesLoaded != null:
return medicinesLoaded(_that);case _IngredientsLoaded() when ingredientsLoaded != null:
return ingredientsLoaded(_that);case FiltersApplied() when filtersApplied != null:
return filtersApplied(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( _MedicinesLoaded value)  medicinesLoaded,required TResult Function( _IngredientsLoaded value)  ingredientsLoaded,required TResult Function( FiltersApplied value)  filtersApplied,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case _MedicinesLoaded():
return medicinesLoaded(_that);case _IngredientsLoaded():
return ingredientsLoaded(_that);case FiltersApplied():
return filtersApplied(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( _MedicinesLoaded value)?  medicinesLoaded,TResult? Function( _IngredientsLoaded value)?  ingredientsLoaded,TResult? Function( FiltersApplied value)?  filtersApplied,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case _MedicinesLoaded() when medicinesLoaded != null:
return medicinesLoaded(_that);case _IngredientsLoaded() when ingredientsLoaded != null:
return ingredientsLoaded(_that);case FiltersApplied() when filtersApplied != null:
return filtersApplied(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<FilterItemModel> medicines)?  medicinesLoaded,TResult Function( List<FilterItemModel> ingredients)?  ingredientsLoaded,TResult Function( FilterParams params)?  filtersApplied,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case _MedicinesLoaded() when medicinesLoaded != null:
return medicinesLoaded(_that.medicines);case _IngredientsLoaded() when ingredientsLoaded != null:
return ingredientsLoaded(_that.ingredients);case FiltersApplied() when filtersApplied != null:
return filtersApplied(_that.params);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<FilterItemModel> medicines)  medicinesLoaded,required TResult Function( List<FilterItemModel> ingredients)  ingredientsLoaded,required TResult Function( FilterParams params)  filtersApplied,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case _MedicinesLoaded():
return medicinesLoaded(_that.medicines);case _IngredientsLoaded():
return ingredientsLoaded(_that.ingredients);case FiltersApplied():
return filtersApplied(_that.params);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<FilterItemModel> medicines)?  medicinesLoaded,TResult? Function( List<FilterItemModel> ingredients)?  ingredientsLoaded,TResult? Function( FilterParams params)?  filtersApplied,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case _MedicinesLoaded() when medicinesLoaded != null:
return medicinesLoaded(_that.medicines);case _IngredientsLoaded() when ingredientsLoaded != null:
return ingredientsLoaded(_that.ingredients);case FiltersApplied() when filtersApplied != null:
return filtersApplied(_that.params);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FilterState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterState.initial()';
}


}




/// @nodoc


class Loading implements FilterState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterState.loading()';
}


}




/// @nodoc


class _MedicinesLoaded implements FilterState {
  const _MedicinesLoaded({required final  List<FilterItemModel> medicines}): _medicines = medicines;
  

 final  List<FilterItemModel> _medicines;
 List<FilterItemModel> get medicines {
  if (_medicines is EqualUnmodifiableListView) return _medicines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medicines);
}


/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicinesLoadedCopyWith<_MedicinesLoaded> get copyWith => __$MedicinesLoadedCopyWithImpl<_MedicinesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicinesLoaded&&const DeepCollectionEquality().equals(other._medicines, _medicines));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_medicines));

@override
String toString() {
  return 'FilterState.medicinesLoaded(medicines: $medicines)';
}


}

/// @nodoc
abstract mixin class _$MedicinesLoadedCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$MedicinesLoadedCopyWith(_MedicinesLoaded value, $Res Function(_MedicinesLoaded) _then) = __$MedicinesLoadedCopyWithImpl;
@useResult
$Res call({
 List<FilterItemModel> medicines
});




}
/// @nodoc
class __$MedicinesLoadedCopyWithImpl<$Res>
    implements _$MedicinesLoadedCopyWith<$Res> {
  __$MedicinesLoadedCopyWithImpl(this._self, this._then);

  final _MedicinesLoaded _self;
  final $Res Function(_MedicinesLoaded) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? medicines = null,}) {
  return _then(_MedicinesLoaded(
medicines: null == medicines ? _self._medicines : medicines // ignore: cast_nullable_to_non_nullable
as List<FilterItemModel>,
  ));
}


}

/// @nodoc


class _IngredientsLoaded implements FilterState {
  const _IngredientsLoaded({required final  List<FilterItemModel> ingredients}): _ingredients = ingredients;
  

 final  List<FilterItemModel> _ingredients;
 List<FilterItemModel> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientsLoadedCopyWith<_IngredientsLoaded> get copyWith => __$IngredientsLoadedCopyWithImpl<_IngredientsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientsLoaded&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'FilterState.ingredientsLoaded(ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$IngredientsLoadedCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$IngredientsLoadedCopyWith(_IngredientsLoaded value, $Res Function(_IngredientsLoaded) _then) = __$IngredientsLoadedCopyWithImpl;
@useResult
$Res call({
 List<FilterItemModel> ingredients
});




}
/// @nodoc
class __$IngredientsLoadedCopyWithImpl<$Res>
    implements _$IngredientsLoadedCopyWith<$Res> {
  __$IngredientsLoadedCopyWithImpl(this._self, this._then);

  final _IngredientsLoaded _self;
  final $Res Function(_IngredientsLoaded) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredients = null,}) {
  return _then(_IngredientsLoaded(
ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<FilterItemModel>,
  ));
}


}

/// @nodoc


class FiltersApplied implements FilterState {
  const FiltersApplied({required this.params});
  

 final  FilterParams params;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FiltersAppliedCopyWith<FiltersApplied> get copyWith => _$FiltersAppliedCopyWithImpl<FiltersApplied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FiltersApplied&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'FilterState.filtersApplied(params: $params)';
}


}

/// @nodoc
abstract mixin class $FiltersAppliedCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory $FiltersAppliedCopyWith(FiltersApplied value, $Res Function(FiltersApplied) _then) = _$FiltersAppliedCopyWithImpl;
@useResult
$Res call({
 FilterParams params
});




}
/// @nodoc
class _$FiltersAppliedCopyWithImpl<$Res>
    implements $FiltersAppliedCopyWith<$Res> {
  _$FiltersAppliedCopyWithImpl(this._self, this._then);

  final FiltersApplied _self;
  final $Res Function(FiltersApplied) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(FiltersApplied(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as FilterParams,
  ));
}


}

/// @nodoc


class _Error implements FilterState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of FilterState
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
  return 'FilterState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
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

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

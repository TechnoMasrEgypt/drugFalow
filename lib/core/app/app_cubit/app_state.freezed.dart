// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState()';
}


}

/// @nodoc
class $AppStateCopyWith<$Res>  {
$AppStateCopyWith(AppState _, $Res Function(AppState) __);
}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LanguageChangeModeState value)?  langChangeMode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LanguageChangeModeState() when langChangeMode != null:
return langChangeMode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LanguageChangeModeState value)  langChangeMode,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LanguageChangeModeState():
return langChangeMode(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LanguageChangeModeState value)?  langChangeMode,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LanguageChangeModeState() when langChangeMode != null:
return langChangeMode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Locale locle)?  langChangeMode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LanguageChangeModeState() when langChangeMode != null:
return langChangeMode(_that.locle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Locale locle)  langChangeMode,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LanguageChangeModeState():
return langChangeMode(_that.locle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Locale locle)?  langChangeMode,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LanguageChangeModeState() when langChangeMode != null:
return langChangeMode(_that.locle);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.initial()';
}


}




/// @nodoc


class LanguageChangeModeState implements AppState {
  const LanguageChangeModeState({required this.locle});
  

 final  Locale locle;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageChangeModeStateCopyWith<LanguageChangeModeState> get copyWith => _$LanguageChangeModeStateCopyWithImpl<LanguageChangeModeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageChangeModeState&&(identical(other.locle, locle) || other.locle == locle));
}


@override
int get hashCode => Object.hash(runtimeType,locle);

@override
String toString() {
  return 'AppState.langChangeMode(locle: $locle)';
}


}

/// @nodoc
abstract mixin class $LanguageChangeModeStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory $LanguageChangeModeStateCopyWith(LanguageChangeModeState value, $Res Function(LanguageChangeModeState) _then) = _$LanguageChangeModeStateCopyWithImpl;
@useResult
$Res call({
 Locale locle
});




}
/// @nodoc
class _$LanguageChangeModeStateCopyWithImpl<$Res>
    implements $LanguageChangeModeStateCopyWith<$Res> {
  _$LanguageChangeModeStateCopyWithImpl(this._self, this._then);

  final LanguageChangeModeState _self;
  final $Res Function(LanguageChangeModeState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locle = null,}) {
  return _then(LanguageChangeModeState(
locle: null == locle ? _self.locle : locle // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}


}

// dart format on

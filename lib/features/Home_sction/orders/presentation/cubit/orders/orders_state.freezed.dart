// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState()';
}


}

/// @nodoc
class $OrdersStateCopyWith<$Res>  {
$OrdersStateCopyWith(OrdersState _, $Res Function(OrdersState) __);
}


/// Adds pattern-matching-related methods to [OrdersState].
extension OrdersStatePatterns on OrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( OrdersLoading value)?  loading,TResult Function( OrdersSuccess value)?  success,TResult Function( CreateOrderSuccess value)?  createOrderSuccess,TResult Function( CreateOrderError value)?  createOrderError,TResult Function( CreateReviewSuccess value)?  createReviewSuccess,TResult Function( CreateReviewError value)?  createReviewError,TResult Function( OrderDetailsSuccess value)?  orderDetailsSuccess,TResult Function( OrderStatusesSuccess value)?  orderStatusesSuccess,TResult Function( OrderStatusesError value)?  orderStatusesError,TResult Function( OrderDetailsError value)?  orderDetailsError,TResult Function( OrdersError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case OrdersLoading() when loading != null:
return loading(_that);case OrdersSuccess() when success != null:
return success(_that);case CreateOrderSuccess() when createOrderSuccess != null:
return createOrderSuccess(_that);case CreateOrderError() when createOrderError != null:
return createOrderError(_that);case CreateReviewSuccess() when createReviewSuccess != null:
return createReviewSuccess(_that);case CreateReviewError() when createReviewError != null:
return createReviewError(_that);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that);case OrderStatusesSuccess() when orderStatusesSuccess != null:
return orderStatusesSuccess(_that);case OrderStatusesError() when orderStatusesError != null:
return orderStatusesError(_that);case OrderDetailsError() when orderDetailsError != null:
return orderDetailsError(_that);case OrdersError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( OrdersLoading value)  loading,required TResult Function( OrdersSuccess value)  success,required TResult Function( CreateOrderSuccess value)  createOrderSuccess,required TResult Function( CreateOrderError value)  createOrderError,required TResult Function( CreateReviewSuccess value)  createReviewSuccess,required TResult Function( CreateReviewError value)  createReviewError,required TResult Function( OrderDetailsSuccess value)  orderDetailsSuccess,required TResult Function( OrderStatusesSuccess value)  orderStatusesSuccess,required TResult Function( OrderStatusesError value)  orderStatusesError,required TResult Function( OrderDetailsError value)  orderDetailsError,required TResult Function( OrdersError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case OrdersLoading():
return loading(_that);case OrdersSuccess():
return success(_that);case CreateOrderSuccess():
return createOrderSuccess(_that);case CreateOrderError():
return createOrderError(_that);case CreateReviewSuccess():
return createReviewSuccess(_that);case CreateReviewError():
return createReviewError(_that);case OrderDetailsSuccess():
return orderDetailsSuccess(_that);case OrderStatusesSuccess():
return orderStatusesSuccess(_that);case OrderStatusesError():
return orderStatusesError(_that);case OrderDetailsError():
return orderDetailsError(_that);case OrdersError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( OrdersLoading value)?  loading,TResult? Function( OrdersSuccess value)?  success,TResult? Function( CreateOrderSuccess value)?  createOrderSuccess,TResult? Function( CreateOrderError value)?  createOrderError,TResult? Function( CreateReviewSuccess value)?  createReviewSuccess,TResult? Function( CreateReviewError value)?  createReviewError,TResult? Function( OrderDetailsSuccess value)?  orderDetailsSuccess,TResult? Function( OrderStatusesSuccess value)?  orderStatusesSuccess,TResult? Function( OrderStatusesError value)?  orderStatusesError,TResult? Function( OrderDetailsError value)?  orderDetailsError,TResult? Function( OrdersError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case OrdersLoading() when loading != null:
return loading(_that);case OrdersSuccess() when success != null:
return success(_that);case CreateOrderSuccess() when createOrderSuccess != null:
return createOrderSuccess(_that);case CreateOrderError() when createOrderError != null:
return createOrderError(_that);case CreateReviewSuccess() when createReviewSuccess != null:
return createReviewSuccess(_that);case CreateReviewError() when createReviewError != null:
return createReviewError(_that);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that);case OrderStatusesSuccess() when orderStatusesSuccess != null:
return orderStatusesSuccess(_that);case OrderStatusesError() when orderStatusesError != null:
return orderStatusesError(_that);case OrderDetailsError() when orderDetailsError != null:
return orderDetailsError(_that);case OrdersError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( MyOrdersResponse data)?  success,TResult Function( CreateOrderResponse data)?  createOrderSuccess,TResult Function( String message)?  createOrderError,TResult Function( CreateReviewResponse data)?  createReviewSuccess,TResult Function( String message)?  createReviewError,TResult Function( OrderDetailsResponse data)?  orderDetailsSuccess,TResult Function( OrderStatusesResponse data)?  orderStatusesSuccess,TResult Function( String message)?  orderStatusesError,TResult Function( String message)?  orderDetailsError,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case OrdersLoading() when loading != null:
return loading();case OrdersSuccess() when success != null:
return success(_that.data);case CreateOrderSuccess() when createOrderSuccess != null:
return createOrderSuccess(_that.data);case CreateOrderError() when createOrderError != null:
return createOrderError(_that.message);case CreateReviewSuccess() when createReviewSuccess != null:
return createReviewSuccess(_that.data);case CreateReviewError() when createReviewError != null:
return createReviewError(_that.message);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that.data);case OrderStatusesSuccess() when orderStatusesSuccess != null:
return orderStatusesSuccess(_that.data);case OrderStatusesError() when orderStatusesError != null:
return orderStatusesError(_that.message);case OrderDetailsError() when orderDetailsError != null:
return orderDetailsError(_that.message);case OrdersError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( MyOrdersResponse data)  success,required TResult Function( CreateOrderResponse data)  createOrderSuccess,required TResult Function( String message)  createOrderError,required TResult Function( CreateReviewResponse data)  createReviewSuccess,required TResult Function( String message)  createReviewError,required TResult Function( OrderDetailsResponse data)  orderDetailsSuccess,required TResult Function( OrderStatusesResponse data)  orderStatusesSuccess,required TResult Function( String message)  orderStatusesError,required TResult Function( String message)  orderDetailsError,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case OrdersLoading():
return loading();case OrdersSuccess():
return success(_that.data);case CreateOrderSuccess():
return createOrderSuccess(_that.data);case CreateOrderError():
return createOrderError(_that.message);case CreateReviewSuccess():
return createReviewSuccess(_that.data);case CreateReviewError():
return createReviewError(_that.message);case OrderDetailsSuccess():
return orderDetailsSuccess(_that.data);case OrderStatusesSuccess():
return orderStatusesSuccess(_that.data);case OrderStatusesError():
return orderStatusesError(_that.message);case OrderDetailsError():
return orderDetailsError(_that.message);case OrdersError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( MyOrdersResponse data)?  success,TResult? Function( CreateOrderResponse data)?  createOrderSuccess,TResult? Function( String message)?  createOrderError,TResult? Function( CreateReviewResponse data)?  createReviewSuccess,TResult? Function( String message)?  createReviewError,TResult? Function( OrderDetailsResponse data)?  orderDetailsSuccess,TResult? Function( OrderStatusesResponse data)?  orderStatusesSuccess,TResult? Function( String message)?  orderStatusesError,TResult? Function( String message)?  orderDetailsError,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case OrdersLoading() when loading != null:
return loading();case OrdersSuccess() when success != null:
return success(_that.data);case CreateOrderSuccess() when createOrderSuccess != null:
return createOrderSuccess(_that.data);case CreateOrderError() when createOrderError != null:
return createOrderError(_that.message);case CreateReviewSuccess() when createReviewSuccess != null:
return createReviewSuccess(_that.data);case CreateReviewError() when createReviewError != null:
return createReviewError(_that.message);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that.data);case OrderStatusesSuccess() when orderStatusesSuccess != null:
return orderStatusesSuccess(_that.data);case OrderStatusesError() when orderStatusesError != null:
return orderStatusesError(_that.message);case OrderDetailsError() when orderDetailsError != null:
return orderDetailsError(_that.message);case OrdersError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OrdersState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.initial()';
}


}




/// @nodoc


class OrdersLoading implements OrdersState {
  const OrdersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.loading()';
}


}




/// @nodoc


class OrdersSuccess implements OrdersState {
  const OrdersSuccess(this.data);
  

 final  MyOrdersResponse data;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersSuccessCopyWith<OrdersSuccess> get copyWith => _$OrdersSuccessCopyWithImpl<OrdersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'OrdersState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $OrdersSuccessCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $OrdersSuccessCopyWith(OrdersSuccess value, $Res Function(OrdersSuccess) _then) = _$OrdersSuccessCopyWithImpl;
@useResult
$Res call({
 MyOrdersResponse data
});




}
/// @nodoc
class _$OrdersSuccessCopyWithImpl<$Res>
    implements $OrdersSuccessCopyWith<$Res> {
  _$OrdersSuccessCopyWithImpl(this._self, this._then);

  final OrdersSuccess _self;
  final $Res Function(OrdersSuccess) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(OrdersSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MyOrdersResponse,
  ));
}


}

/// @nodoc


class CreateOrderSuccess implements OrdersState {
  const CreateOrderSuccess(this.data);
  

 final  CreateOrderResponse data;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderSuccessCopyWith<CreateOrderSuccess> get copyWith => _$CreateOrderSuccessCopyWithImpl<CreateOrderSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'OrdersState.createOrderSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateOrderSuccessCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $CreateOrderSuccessCopyWith(CreateOrderSuccess value, $Res Function(CreateOrderSuccess) _then) = _$CreateOrderSuccessCopyWithImpl;
@useResult
$Res call({
 CreateOrderResponse data
});




}
/// @nodoc
class _$CreateOrderSuccessCopyWithImpl<$Res>
    implements $CreateOrderSuccessCopyWith<$Res> {
  _$CreateOrderSuccessCopyWithImpl(this._self, this._then);

  final CreateOrderSuccess _self;
  final $Res Function(CreateOrderSuccess) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CreateOrderSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreateOrderResponse,
  ));
}


}

/// @nodoc


class CreateOrderError implements OrdersState {
  const CreateOrderError(this.message);
  

 final  String message;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderErrorCopyWith<CreateOrderError> get copyWith => _$CreateOrderErrorCopyWithImpl<CreateOrderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrdersState.createOrderError(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateOrderErrorCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $CreateOrderErrorCopyWith(CreateOrderError value, $Res Function(CreateOrderError) _then) = _$CreateOrderErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreateOrderErrorCopyWithImpl<$Res>
    implements $CreateOrderErrorCopyWith<$Res> {
  _$CreateOrderErrorCopyWithImpl(this._self, this._then);

  final CreateOrderError _self;
  final $Res Function(CreateOrderError) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreateOrderError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateReviewSuccess implements OrdersState {
  const CreateReviewSuccess(this.data);
  

 final  CreateReviewResponse data;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReviewSuccessCopyWith<CreateReviewSuccess> get copyWith => _$CreateReviewSuccessCopyWithImpl<CreateReviewSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReviewSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'OrdersState.createReviewSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateReviewSuccessCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $CreateReviewSuccessCopyWith(CreateReviewSuccess value, $Res Function(CreateReviewSuccess) _then) = _$CreateReviewSuccessCopyWithImpl;
@useResult
$Res call({
 CreateReviewResponse data
});




}
/// @nodoc
class _$CreateReviewSuccessCopyWithImpl<$Res>
    implements $CreateReviewSuccessCopyWith<$Res> {
  _$CreateReviewSuccessCopyWithImpl(this._self, this._then);

  final CreateReviewSuccess _self;
  final $Res Function(CreateReviewSuccess) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CreateReviewSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreateReviewResponse,
  ));
}


}

/// @nodoc


class CreateReviewError implements OrdersState {
  const CreateReviewError(this.message);
  

 final  String message;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReviewErrorCopyWith<CreateReviewError> get copyWith => _$CreateReviewErrorCopyWithImpl<CreateReviewError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReviewError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrdersState.createReviewError(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateReviewErrorCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $CreateReviewErrorCopyWith(CreateReviewError value, $Res Function(CreateReviewError) _then) = _$CreateReviewErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreateReviewErrorCopyWithImpl<$Res>
    implements $CreateReviewErrorCopyWith<$Res> {
  _$CreateReviewErrorCopyWithImpl(this._self, this._then);

  final CreateReviewError _self;
  final $Res Function(CreateReviewError) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreateReviewError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OrderDetailsSuccess implements OrdersState {
  const OrderDetailsSuccess(this.data);
  

 final  OrderDetailsResponse data;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsSuccessCopyWith<OrderDetailsSuccess> get copyWith => _$OrderDetailsSuccessCopyWithImpl<OrderDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'OrdersState.orderDetailsSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $OrderDetailsSuccessCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $OrderDetailsSuccessCopyWith(OrderDetailsSuccess value, $Res Function(OrderDetailsSuccess) _then) = _$OrderDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 OrderDetailsResponse data
});




}
/// @nodoc
class _$OrderDetailsSuccessCopyWithImpl<$Res>
    implements $OrderDetailsSuccessCopyWith<$Res> {
  _$OrderDetailsSuccessCopyWithImpl(this._self, this._then);

  final OrderDetailsSuccess _self;
  final $Res Function(OrderDetailsSuccess) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(OrderDetailsSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderDetailsResponse,
  ));
}


}

/// @nodoc


class OrderStatusesSuccess implements OrdersState {
  const OrderStatusesSuccess(this.data);
  

 final  OrderStatusesResponse data;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderStatusesSuccessCopyWith<OrderStatusesSuccess> get copyWith => _$OrderStatusesSuccessCopyWithImpl<OrderStatusesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderStatusesSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'OrdersState.orderStatusesSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $OrderStatusesSuccessCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $OrderStatusesSuccessCopyWith(OrderStatusesSuccess value, $Res Function(OrderStatusesSuccess) _then) = _$OrderStatusesSuccessCopyWithImpl;
@useResult
$Res call({
 OrderStatusesResponse data
});




}
/// @nodoc
class _$OrderStatusesSuccessCopyWithImpl<$Res>
    implements $OrderStatusesSuccessCopyWith<$Res> {
  _$OrderStatusesSuccessCopyWithImpl(this._self, this._then);

  final OrderStatusesSuccess _self;
  final $Res Function(OrderStatusesSuccess) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(OrderStatusesSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderStatusesResponse,
  ));
}


}

/// @nodoc


class OrderStatusesError implements OrdersState {
  const OrderStatusesError(this.message);
  

 final  String message;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderStatusesErrorCopyWith<OrderStatusesError> get copyWith => _$OrderStatusesErrorCopyWithImpl<OrderStatusesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderStatusesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrdersState.orderStatusesError(message: $message)';
}


}

/// @nodoc
abstract mixin class $OrderStatusesErrorCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $OrderStatusesErrorCopyWith(OrderStatusesError value, $Res Function(OrderStatusesError) _then) = _$OrderStatusesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OrderStatusesErrorCopyWithImpl<$Res>
    implements $OrderStatusesErrorCopyWith<$Res> {
  _$OrderStatusesErrorCopyWithImpl(this._self, this._then);

  final OrderStatusesError _self;
  final $Res Function(OrderStatusesError) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OrderStatusesError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OrderDetailsError implements OrdersState {
  const OrderDetailsError(this.message);
  

 final  String message;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsErrorCopyWith<OrderDetailsError> get copyWith => _$OrderDetailsErrorCopyWithImpl<OrderDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrdersState.orderDetailsError(message: $message)';
}


}

/// @nodoc
abstract mixin class $OrderDetailsErrorCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $OrderDetailsErrorCopyWith(OrderDetailsError value, $Res Function(OrderDetailsError) _then) = _$OrderDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OrderDetailsErrorCopyWithImpl<$Res>
    implements $OrderDetailsErrorCopyWith<$Res> {
  _$OrderDetailsErrorCopyWithImpl(this._self, this._then);

  final OrderDetailsError _self;
  final $Res Function(OrderDetailsError) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OrderDetailsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OrdersError implements OrdersState {
  const OrdersError(this.message);
  

 final  String message;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersErrorCopyWith<OrdersError> get copyWith => _$OrdersErrorCopyWithImpl<OrdersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrdersState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $OrdersErrorCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory $OrdersErrorCopyWith(OrdersError value, $Res Function(OrdersError) _then) = _$OrdersErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OrdersErrorCopyWithImpl<$Res>
    implements $OrdersErrorCopyWith<$Res> {
  _$OrdersErrorCopyWithImpl(this._self, this._then);

  final OrdersError _self;
  final $Res Function(OrdersError) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OrdersError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CartDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartResponseModelToJson(CartResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

CartDataModel _$CartDataModelFromJson(Map<String, dynamic> json) =>
    CartDataModel(
      id: (json['id'] as num).toInt(),
      warehouse: WarehouseModel.fromJson(
        json['warehouse'] as Map<String, dynamic>,
      ),
      isDrafted: json['is_drafted'] as bool,
      cartItems: (json['cart_items'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTotal: json['sub_total'] as num,
      orderFees: json['order_fees'] as num,
      total: json['total'] as num,
    );

Map<String, dynamic> _$CartDataModelToJson(CartDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouse': instance.warehouse.toJson(),
      'is_drafted': instance.isDrafted,
      'cart_items': instance.cartItems.map((e) => e.toJson()).toList(),
      'sub_total': instance.subTotal,
      'order_fees': instance.orderFees,
      'total': instance.total,
    };

WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) =>
    WarehouseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$WarehouseModelToJson(WarehouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: (json['id'] as num).toInt(),
      product: CartProductModel.fromJson(
        json['product'] as Map<String, dynamic>,
      ),
      quantity: (json['quantity'] as num).toInt(),
      isDrafted: json['is_drafted'] as bool,
      totalPrice: json['total_price'] as num,
      medicineId: (json['medicine_id'] as num).toInt(),
      oldWarehouseId: (json['old_warehouse_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      transferWarehouses: const TransferWarehousesConverter().fromJson(
        json['transfer_warehouses'],
      ),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product.toJson(),
      'quantity': instance.quantity,
      'is_drafted': instance.isDrafted,
      'total_price': instance.totalPrice,
      'medicine_id': instance.medicineId,
      'old_warehouse_id': instance.oldWarehouseId,
      'product_id': instance.productId,
      'transfer_warehouses': const TransferWarehousesConverter().toJson(
        instance.transferWarehouses,
      ),
    };

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] as String,
      priceBeforeDiscount: json['price_before_discount'] as String,
      discountPercentage: (json['discount_percentage'] as num).toDouble(),
      activeIngredients: (json['active_ingredients'] as List<dynamic>)
          .map((e) => ActiveIngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'price_before_discount': instance.priceBeforeDiscount,
      'discount_percentage': instance.discountPercentage,
      'active_ingredients': instance.activeIngredients
          .map((e) => e.toJson())
          .toList(),
    };

ActiveIngredientModel _$ActiveIngredientModelFromJson(
  Map<String, dynamic> json,
) => ActiveIngredientModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$ActiveIngredientModelToJson(
  ActiveIngredientModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

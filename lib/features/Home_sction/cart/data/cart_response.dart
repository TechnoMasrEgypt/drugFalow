import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CartResponseModel {
  final bool success;
  final String message;
  final List<CartDataModel> data;

  CartResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CartDataModel {
  final int id;

  final WarehouseModel warehouse;

  @JsonKey(name: 'is_drafted')
  final bool isDrafted;

  @JsonKey(name: 'cart_items')
  final List<CartItemModel> cartItems;

  @JsonKey(name: 'sub_total')
  final num subTotal;

  @JsonKey(name: 'order_fees')
  final num orderFees;

  final num total;

  CartDataModel({
    required this.id,
    required this.warehouse,
    required this.isDrafted,
    required this.cartItems,
    required this.subTotal,
    required this.orderFees,
    required this.total,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) =>
      _$CartDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataModelToJson(this);
}

@JsonSerializable()
class WarehouseModel {
  final int id;
  final String name;
  final String logo;

  WarehouseModel({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CartItemModel {
  final int id;

  final CartProductModel product;

  final int quantity;

  @JsonKey(name: 'is_drafted')
  final bool isDrafted;

  @JsonKey(name: 'total_price')
  final num totalPrice;

  @JsonKey(name: 'medicine_id')
  final int medicineId;

  @JsonKey(name: 'old_warehouse_id')
  final int oldWarehouseId;

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'transfer_warehouses')
  final List<dynamic> transferWarehouses;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
    required this.isDrafted,
    required this.totalPrice,
    required this.medicineId,
    required this.oldWarehouseId,
    required this.productId,
    required this.transferWarehouses,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CartProductModel {
  final int id;

  final String name;

  final String image;

  final String price;

  @JsonKey(name: 'price_before_discount')
  final String priceBeforeDiscount;

  @JsonKey(name: 'discount_percentage')
  final double discountPercentage;

  @JsonKey(name: 'active_ingredients')
  final List<ActiveIngredientModel> activeIngredients;

  CartProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.priceBeforeDiscount,
    required this.discountPercentage,
    required this.activeIngredients,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
}

@JsonSerializable()
class ActiveIngredientModel {
  final int id;
  final String name;

  ActiveIngredientModel({
    required this.id,
    required this.name,
  });

  factory ActiveIngredientModel.fromJson(Map<String, dynamic> json) =>
      _$ActiveIngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveIngredientModelToJson(this);
}
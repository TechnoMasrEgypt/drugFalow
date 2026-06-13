import 'package:json_annotation/json_annotation.dart';

part 'warehouse_details_response.g.dart';

@JsonSerializable(explicitToJson: true)
class WarehouseDetailsResponse {
  final bool? success;
  final String? message;
  final ExtraModel? extra;
  final List<ProductModel>? items;
  final MetaModel? meta;

  WarehouseDetailsResponse({
    this.success,
    this.message,
    this.extra,
    this.items,
    this.meta,
  });

  factory WarehouseDetailsResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WarehouseDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WarehouseDetailsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExtraModel {
  final WarehouseDetailsData? warehouse;

  ExtraModel({
    this.warehouse,
  });

  factory ExtraModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ExtraModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ExtraModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WarehouseDetailsData {
  final int? id;

  @JsonKey(name: 'warehouse_code')
  final String? warehouseCode;

  final String? name;
  final String? logo;
  final String? phone;
  final String? email;

  @JsonKey(name: 'delivery_supervisor_phone')
  final String? deliverySupervisorPhone;

  @JsonKey(name: 'working_days')
  final List<String>? workingDays;

  @JsonKey(name: 'delivery_times')
  final String? deliveryTimes;

  @JsonKey(name: 'working_times')
  final String? workingTimes;

  @JsonKey(name: 'minimum_purchase')
  final String? minimumPurchase;

  @JsonKey(name: 'order_fees')
  final String? orderFees;

  final List<GovernorateModel>? governorates;
  final List<CityModel>? cities;
  final List<AreaModel>? areas;

  WarehouseDetailsData({
    this.id,
    this.warehouseCode,
    this.name,
    this.logo,
    this.phone,
    this.email,
    this.deliverySupervisorPhone,
    this.workingDays,
    this.deliveryTimes,
    this.workingTimes,
    this.minimumPurchase,
    this.orderFees,
    this.governorates,
    this.cities,
    this.areas,
  });

  factory WarehouseDetailsData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WarehouseDetailsDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WarehouseDetailsDataToJson(this);
}

@JsonSerializable()
class GovernorateModel {
  final int? id;
  final String? name;

  GovernorateModel({
    this.id,
    this.name,
  });

  factory GovernorateModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GovernorateModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GovernorateModelToJson(this);
}

@JsonSerializable()
class CityModel {
  final int? id;
  final String? name;

  CityModel({
    this.id,
    this.name,
  });

  factory CityModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CityModelToJson(this);
}

@JsonSerializable()
class AreaModel {
  final int? id;
  final String? name;

  @JsonKey(name: 'city_id')
  final int? cityId;

  AreaModel({
    this.id,
    this.name,
    this.cityId,
  });

  factory AreaModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AreaModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AreaModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductModel {
  final int? id;
  final String? name;
  final String? image;
  final String? price;

  @JsonKey(name: 'price_before_discount')
  final String? priceBeforeDiscount;

  @JsonKey(name: 'discount_percentage')
  final num? discountPercentage;

  final String? category;

  @JsonKey(name: 'active_ingredients')
  final List<ActiveIngredientModel>? activeIngredients;

  final ProductWarehouseModel? warehouse;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.priceBeforeDiscount,
    this.discountPercentage,
    this.category,
    this.activeIngredients,
    this.warehouse,
  });

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductModelToJson(this);
}

@JsonSerializable()
class ActiveIngredientModel {
  final int? id;
  final String? name;

  ActiveIngredientModel({
    this.id,
    this.name,
  });

  factory ActiveIngredientModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ActiveIngredientModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ActiveIngredientModelToJson(this);
}

@JsonSerializable()
class ProductWarehouseModel {
  final int? id;
  final String? name;
  final String? logo;

  ProductWarehouseModel({
    this.id,
    this.name,
    this.logo,
  });

  factory ProductWarehouseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ProductWarehouseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductWarehouseModelToJson(this);
}

@JsonSerializable()
class MetaModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  @JsonKey(name: 'per_page')
  final int? perPage;

  final int? total;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  MetaModel({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory MetaModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MetaModelToJson(this);
}
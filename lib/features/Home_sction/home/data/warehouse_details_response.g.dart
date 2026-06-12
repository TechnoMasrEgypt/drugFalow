// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseDetailsData _$WarehouseDetailsDataFromJson(
  Map<String, dynamic> json,
) => WarehouseDetailsData(
  id: (json['id'] as num?)?.toInt(),
  warehouseCode: json['warehouse_code'] as String?,
  name: json['name'] as String?,
  logo: json['logo'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  deliverySupervisorPhone: json['delivery_supervisor_phone'] as String?,
  workingDays: (json['working_days'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  deliveryTimes: json['delivery_times'] as String?,
  workingTimes: json['working_times'] as String?,
  minimumPurchase: json['minimum_purchase'] as String?,
  orderFees: json['order_fees'] as String?,
  governorates: (json['governorates'] as List<dynamic>?)
      ?.map((e) => GovernorateModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  cities: (json['cities'] as List<dynamic>?)
      ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  areas: (json['areas'] as List<dynamic>?)
      ?.map((e) => AreaModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WarehouseDetailsDataToJson(
  WarehouseDetailsData instance,
) => <String, dynamic>{
  'id': instance.id,
  'warehouse_code': instance.warehouseCode,
  'name': instance.name,
  'logo': instance.logo,
  'phone': instance.phone,
  'email': instance.email,
  'delivery_supervisor_phone': instance.deliverySupervisorPhone,
  'working_days': instance.workingDays,
  'delivery_times': instance.deliveryTimes,
  'working_times': instance.workingTimes,
  'minimum_purchase': instance.minimumPurchase,
  'order_fees': instance.orderFees,
  'governorates': instance.governorates,
  'cities': instance.cities,
  'areas': instance.areas,
};

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
  currentPage: (json['current_page'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  nextPageUrl: json['next_page_url'] as String?,
  prevPageUrl: json['prev_page_url'] as String?,
);

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'per_page': instance.perPage,
  'total': instance.total,
  'next_page_url': instance.nextPageUrl,
  'prev_page_url': instance.prevPageUrl,
};

GovernorateModel _$GovernorateModelFromJson(Map<String, dynamic> json) =>
    GovernorateModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GovernorateModelToJson(GovernorateModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

CityModel _$CityModelFromJson(Map<String, dynamic> json) =>
    CityModel(id: (json['id'] as num?)?.toInt(), name: json['name'] as String?);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

AreaModel _$AreaModelFromJson(Map<String, dynamic> json) => AreaModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  cityId: (json['city_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$AreaModelToJson(AreaModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'city_id': instance.cityId,
};

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  price: json['price'] as String?,
  category: json['category'] as String?,
  activeIngredients: (json['active_ingredients'] as List<dynamic>?)
      ?.map((e) => ActiveIngredientModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  warehouse: json['warehouse'] == null
      ? null
      : ProductWarehouseModel.fromJson(
          json['warehouse'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'category': instance.category,
      'active_ingredients': instance.activeIngredients,
      'warehouse': instance.warehouse,
    };

ActiveIngredientModel _$ActiveIngredientModelFromJson(
  Map<String, dynamic> json,
) => ActiveIngredientModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$ActiveIngredientModelToJson(
  ActiveIngredientModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

ProductWarehouseModel _$ProductWarehouseModelFromJson(
  Map<String, dynamic> json,
) => ProductWarehouseModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  logo: json['logo'] as String?,
);

Map<String, dynamic> _$ProductWarehouseModelToJson(
  ProductWarehouseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo': instance.logo,
};

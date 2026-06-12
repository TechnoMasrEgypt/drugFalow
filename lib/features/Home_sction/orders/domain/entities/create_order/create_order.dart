class CreateOrderResponse {
  bool? success;
  String? message;
  Data? data;

  CreateOrderResponse({this.success, this.message, this.data});

  CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic orderCode;
  dynamic pharmacyId;
  dynamic governorateId;
  dynamic cityId;
  dynamic areaId;
  dynamic totalPrice;
  dynamic discount;
  dynamic finalPrice;
 dynamic comment;
  dynamic updatedAt;
  dynamic createdAt;
  int? id;

  Data(
      {this.orderCode,
        this.pharmacyId,
        this.governorateId,
        this.cityId,
        this.areaId,
        this.totalPrice,
        this.discount,
        this.finalPrice,
        this.comment,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    orderCode = json['order_code'];
    pharmacyId = json['pharmacy_id'];
    governorateId = json['governorate_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    totalPrice = json['total_price'];
    discount = json['discount'];
    finalPrice = json['final_price'];
    comment = json['comment'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_code'] = orderCode;
    data['pharmacy_id'] = pharmacyId;
    data['governorate_id'] = governorateId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['total_price'] = totalPrice;
    data['discount'] = discount;
    data['final_price'] = finalPrice;
    data['comment'] = comment;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
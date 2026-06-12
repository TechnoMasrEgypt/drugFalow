class OrderDetailsResponse {
  bool? success;
  String? message;
  Data? data;

  OrderDetailsResponse({this.success, this.message, this.data});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  dynamic orderCode;
  dynamic status;
  dynamic totalPrice;
  dynamic discount;
  dynamic finalPrice;
  List<Items>? items;

  Data(
      {this.id,
        this.orderCode,
        this.status,
        this.totalPrice,
        this.discount,
        this.finalPrice,
        this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCode = json['order_code'];
    status = json['status'];
    totalPrice = json['total_price'];
    discount = json['discount'];
    finalPrice = json['final_price'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_code'] = orderCode;
    data['status'] = status;
    data['total_price'] = totalPrice;
    data['discount'] = discount;
    data['final_price'] = finalPrice;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  dynamic productId;
  dynamic productName;
  dynamic productImage;
  dynamic quantity;
  dynamic price;

  Items(
      {this.id,
        this.productId,
        this.productName,
        this.productImage,
        this.quantity,
        this.price});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
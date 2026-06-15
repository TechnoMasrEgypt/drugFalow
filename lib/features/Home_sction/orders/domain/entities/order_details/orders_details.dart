class OrderDetailsResponse {
  bool? success;
  String? message;
  OrderDetailsData? data;

  OrderDetailsResponse({
    this.success,
    this.message,
    this.data,
  });

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? OrderDetailsData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class OrderDetailsData {
  int? id;
  String? orderCode;
  String? status;
  String? totalPrice;
  String? discount;
  String? finalPrice;
  Warehouse? warehouse;
  List<OrderItemDetails>? items;

  OrderDetailsData({
    this.id,
    this.orderCode,
    this.status,
    this.totalPrice,
    this.discount,
    this.finalPrice,
    this.warehouse,
    this.items,
  });

  OrderDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCode = json['order_code'];
    status = json['status'];
    totalPrice = json['total_price'];
    discount = json['discount'];
    finalPrice = json['final_price'];

    warehouse = json['warehouse'] != null
        ? Warehouse.fromJson(json['warehouse'])
        : null;

    if (json['items'] != null) {
      items = <OrderItemDetails>[];
      json['items'].forEach((v) {
        items!.add(OrderItemDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_code': orderCode,
      'status': status,
      'total_price': totalPrice,
      'discount': discount,
      'final_price': finalPrice,
      'warehouse': warehouse?.toJson(),
      'items': items?.map((e) => e.toJson()).toList(),
    };
  }
}

class Warehouse {
  int? id;
  String? name;
  String? logo;

  Warehouse({
    this.id,
    this.name,
    this.logo,
  });

  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
    };
  }
}

class OrderItemDetails {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
  int? quantity;
  String? price;

  OrderItemDetails({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
    this.quantity,
    this.price,
  });

  OrderItemDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'quantity': quantity,
      'price': price,
    };
  }
}
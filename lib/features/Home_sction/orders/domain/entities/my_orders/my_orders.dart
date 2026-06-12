class MyOrdersResponse {
  bool? success;
  String? message;
  Data? data;

  MyOrdersResponse({this.success, this.message, this.data});

  MyOrdersResponse.fromJson(Map<String, dynamic> json) {
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
  List<Items>? items;
  Meta? meta;

  Data({this.items, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Items {
  int? id;
  dynamic orderCode;
  dynamic itemsCount;
  dynamic status;
  dynamic finalPrice;

  Items(
      {this.id, this.orderCode, this.itemsCount, this.status, this.finalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCode = json['order_code'];
    itemsCount = json['items_count'];
    status = json['status'];
    finalPrice = json['final_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_code'] = orderCode;
    data['items_count'] = itemsCount;
    data['status'] = status;
    data['final_price'] = finalPrice;
    return data;
  }
}

class Meta {
  dynamic currentPage;
  dynamic lastPage;
  dynamic perPage;
  dynamic total;
  dynamic nextPageUrl;
  dynamic prevPageUrl;

  Meta(
      {this.currentPage,
        this.lastPage,
        this.perPage,
        this.total,
        this.nextPageUrl,
        this.prevPageUrl});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    perPage = json['per_page'];
    total = json['total'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['per_page'] = perPage;
    data['total'] = total;
    data['next_page_url'] = nextPageUrl;
    data['prev_page_url'] = prevPageUrl;
    return data;
  }
}
class ProductDetailsResponse {
  bool? success;
  String? message;
  Data? data;

  ProductDetailsResponse({this.success, this.message, this.data});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  dynamic name;
  dynamic image;
  dynamic price;
  dynamic category;
  List<ActiveIngredients>? activeIngredients;
  Warehouse? warehouse;

  Data(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.category,
        this.activeIngredients,
        this.warehouse});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    category = json['category'];
    if (json['active_ingredients'] != null) {
      activeIngredients = <ActiveIngredients>[];
      json['active_ingredients'].forEach((v) {
        activeIngredients!.add(new ActiveIngredients.fromJson(v));
      });
    }
    warehouse = json['warehouse'] != null
        ? new Warehouse.fromJson(json['warehouse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['category'] = category;
    if (activeIngredients != null) {
      data['active_ingredients'] =
          activeIngredients!.map((v) => v.toJson()).toList();
    }
    if (warehouse != null) {
      data['warehouse'] = warehouse!.toJson();
    }
    return data;
  }
}

class ActiveIngredients {
  int? id;
  dynamic name;

  ActiveIngredients({this.id, this.name});

  ActiveIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Warehouse {
  dynamic id;
  dynamic name;
 dynamic logo;

  Warehouse({this.id, this.name, this.logo});

  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}
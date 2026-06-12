class SliderResponse {
  bool? success;
  String? message;
  List<SliderItem>? data;

  SliderResponse({
    this.success,
    this.message,
    this.data,
  });

  SliderResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];

    if (json['data'] != null) {
      data = <SliderItem>[];
      json['data'].forEach((v) {
        data!.add(SliderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};

    dataMap['success'] = success;
    dataMap['message'] = message;

    if (data != null) {
      dataMap['data'] = data!.map((v) => v.toJson()).toList();
    }

    return dataMap;
  }
}

class SliderItem {
  int? id;
  String? image;

  SliderItem({
    this.id,
    this.image,
  });

  SliderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['image'] = image;

    return data;
  }
}
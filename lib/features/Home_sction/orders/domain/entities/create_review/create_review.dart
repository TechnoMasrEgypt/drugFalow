class CreateReviewResponse {
  bool? success;
  String? message;
  Data? data;

  CreateReviewResponse({this.success, this.message, this.data});

  CreateReviewResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  dynamic id;
  dynamic orderId;
  dynamic review;
  dynamic rating;
  dynamic createdAt;
  dynamic updatedAt;

  Data(
      {this.id,
        this.orderId,
        this.review,
        this.rating,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    review = json['review'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['review'] = review;
    data['rating'] = rating;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
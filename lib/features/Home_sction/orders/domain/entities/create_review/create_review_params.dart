class CreateReviewParams {
  dynamic orderId;
  dynamic review;
  dynamic rating;

  CreateReviewParams({this.orderId, this.review, this.rating});

  Map<String,dynamic>toMap(){
    return {
      "order_id" : orderId,
      "review" : review,
      "rating" : rating
    };
  }
}
class CreateOrderParams {
  dynamic governorateId;
  dynamic cityId;
  dynamic areaId;

  CreateOrderParams({this.governorateId, this.cityId, this.areaId});

  Map<String,dynamic>toMap(){
    return {
      "governorate_id" : governorateId,
      "city_id" : cityId,
      "area_id" : areaId
    };
  }
}
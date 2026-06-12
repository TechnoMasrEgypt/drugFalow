class ProductsParams {
  dynamic categoryId;
  dynamic search;
  dynamic activeIngredientId;
  dynamic warehouseId;
  dynamic sortPrice;

  ProductsParams({this.categoryId, this.search, this.activeIngredientId,
    this.warehouseId, this.sortPrice});

  Map<String,dynamic>toMap(){
    return {
      "category_id" : categoryId,
      "search" : search,
      "active_ingredient_id" : activeIngredientId,
      "warehouse_id" : warehouseId,
      "sort_price" : sortPrice
    };
  }


}
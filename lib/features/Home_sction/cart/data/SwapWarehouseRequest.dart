class SwapWarehouseRequest {
  final int medicineId;
  final int oldWarehouseId;
  final int productId;
  final int newWarehouseId;

  SwapWarehouseRequest({
    required this.medicineId,
    required this.oldWarehouseId,
    required this.productId,
    required this.newWarehouseId,
  });

  Map<String, dynamic> toJson() {
    return {
      "medicine_id": medicineId,
      "old_warehouse_id": oldWarehouseId,
      "product_id": productId,
      "new_warehouse_id": newWarehouseId,
    };
  }
}
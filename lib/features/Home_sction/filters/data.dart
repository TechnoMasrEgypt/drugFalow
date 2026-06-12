// ─────────────────────────────────────────────
// lib/features/Home_sction/products/data/models/filter_models.dart
// ─────────────────────────────────────────────

class FilterItemModel {
  final int id;
  final String name;
  bool isSelected;

  FilterItemModel({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  factory FilterItemModel.fromJson(Map<String, dynamic> json) =>
      FilterItemModel(id: json['id'] as int, name: json['name'] as String);

  FilterItemModel copyWith({bool? isSelected}) =>
      FilterItemModel(id: id, name: name, isSelected: isSelected ?? this.isSelected);
}

class FilterListResponse {
  final bool success;
  final String message;
  final List<FilterItemModel> data;

  FilterListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FilterListResponse.fromJson(Map<String, dynamic> json) =>
      FilterListResponse(
        success: json['success'] as bool,
        message: json['message'] as String,
        data: (json['data'] as List)
            .map((e) => FilterItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

// Sort options enum
enum SortOption {
  priceAsc,
  priceDesc,
  discountDesc,
  discountAsc,
}

extension SortOptionLabel on SortOption {
  String get label {
    switch (this) {
      case SortOption.priceAsc:
        return "السعر من الأقل للأعلى";
      case SortOption.priceDesc:
        return "السعر من الأعلى للأقل";
      case SortOption.discountDesc:
        return "الخصم الأعلى";
      case SortOption.discountAsc:
        return "الخصم الأقل";
    }
  }

  /// Query param value sent to API
  String get queryValue {
    switch (this) {
      case SortOption.priceAsc:
        return "price_asc";
      case SortOption.priceDesc:
        return "price_desc";
      case SortOption.discountDesc:
        return "discount_desc";
      case SortOption.discountAsc:
        return "discount_asc";
    }
  }
}
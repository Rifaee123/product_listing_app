import 'package:json_annotation/json_annotation.dart';

import 'addon.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  List<dynamic>? variations;
  @JsonKey(name: 'in_wishlist')
  bool? inWishlist;
  @JsonKey(name: 'avg_rating')
  int? avgRating;
  List<String>? images;
  @JsonKey(name: 'variation_exists')
  bool? variationExists;
  @JsonKey(name: 'sale_price')
  int? salePrice;
  List<Addon>? addons;
  bool? available;
  @JsonKey(name: 'available_from')
  String? availableFrom;
  @JsonKey(name: 'available_to')
  String? availableTo;
  String? name;
  String? description;
  String? caption;
  @JsonKey(name: 'featured_image')
  String? featuredImage;
  int? mrp;
  int? stock;
  @JsonKey(name: 'is_active')
  bool? isActive;
  String? discount;
  @JsonKey(name: 'created_date')
  DateTime? createdDate;
  @JsonKey(name: 'product_type')
  String? productType;
  @JsonKey(name: 'showing_order')
  dynamic showingOrder;
  @JsonKey(name: 'variation_name')
  String? variationName;
  int? category;
  @JsonKey(name: 'tax_rate')
  int? taxRate;

  ProductModel({
    this.id,
    this.variations,
    this.inWishlist,
    this.avgRating,
    this.images,
    this.variationExists,
    this.salePrice,
    this.addons,
    this.available,
    this.availableFrom,
    this.availableTo,
    this.name,
    this.description,
    this.caption,
    this.featuredImage,
    this.mrp,
    this.stock,
    this.isActive,
    this.discount,
    this.createdDate,
    this.productType,
    this.showingOrder,
    this.variationName,
    this.category,
    this.taxRate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

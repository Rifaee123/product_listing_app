// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num?)?.toInt(),
      variations: json['variations'] as List<dynamic>?,
      inWishlist: json['in_wishlist'] as bool?,
      avgRating: (json['avg_rating'] as num?)?.toInt(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      variationExists: json['variation_exists'] as bool?,
      salePrice: (json['sale_price'] as num?)?.toInt(),
      addons: (json['addons'] as List<dynamic>?)
          ?.map((e) => Addon.fromJson(e as Map<String, dynamic>))
          .toList(),
      available: json['available'] as bool?,
      availableFrom: json['available_from'] as String?,
      availableTo: json['available_to'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      featuredImage: json['featured_image'] as String?,
      mrp: (json['mrp'] as num?)?.toInt(),
      stock: (json['stock'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      discount: json['discount'] as String?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      productType: json['product_type'] as String?,
      showingOrder: json['showing_order'],
      variationName: json['variation_name'] as String?,
      category: (json['category'] as num?)?.toInt(),
      taxRate: (json['tax_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variations': instance.variations,
      'in_wishlist': instance.inWishlist,
      'avg_rating': instance.avgRating,
      'images': instance.images,
      'variation_exists': instance.variationExists,
      'sale_price': instance.salePrice,
      'addons': instance.addons,
      'available': instance.available,
      'available_from': instance.availableFrom,
      'available_to': instance.availableTo,
      'name': instance.name,
      'description': instance.description,
      'caption': instance.caption,
      'featured_image': instance.featuredImage,
      'mrp': instance.mrp,
      'stock': instance.stock,
      'is_active': instance.isActive,
      'discount': instance.discount,
      'created_date': instance.createdDate?.toIso8601String(),
      'product_type': instance.productType,
      'showing_order': instance.showingOrder,
      'variation_name': instance.variationName,
      'category': instance.category,
      'tax_rate': instance.taxRate,
    };

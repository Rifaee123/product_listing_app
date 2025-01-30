// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Addon _$AddonFromJson(Map<String, dynamic> json) => Addon(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      featuredImage: json['featured_image'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      taxRate: (json['tax_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddonToJson(Addon instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
      'description': instance.description,
      'featured_image': instance.featuredImage,
      'stock': instance.stock,
      'is_active': instance.isActive,
      'tax_rate': instance.taxRate,
    };

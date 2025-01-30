import 'package:json_annotation/json_annotation.dart';

part 'addon.g.dart';

@JsonSerializable()
class Addon {
  int? id;
  int? price;
  String? name;
  String? description;
  @JsonKey(name: 'featured_image')
  String? featuredImage;
  int? stock;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'tax_rate')
  int? taxRate;

  Addon({
    this.id,
    this.price,
    this.name,
    this.description,
    this.featuredImage,
    this.stock,
    this.isActive,
    this.taxRate,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);

  Map<String, dynamic> toJson() => _$AddonToJson(this);
}

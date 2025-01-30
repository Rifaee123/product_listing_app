// import 'dart:convert';

// class Product {
//   final int id;
//   final String name;
//   final String description;
//   final String caption;
//   final String featuredImage;
//   final List<String> images;
//   final double salePrice;
//   final double mrp;
//   final bool inWishlist;
//   final bool available;
//   final String availableFrom;
//   final String availableTo;
//   final String productType;
//   final double discount;
//   final int stock;
//   final bool isActive;
//   final double taxRate;
//   final List<Addon> addons;

//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.caption,
//     required this.featuredImage,
//     required this.images,
//     required this.salePrice,
//     required this.mrp,
//     required this.inWishlist,
//     required this.available,
//     required this.availableFrom,
//     required this.availableTo,
//     required this.productType,
//     required this.discount,
//     required this.stock,
//     required this.isActive,
//     required this.taxRate,
//     required this.addons,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//       caption: json['caption'] ?? '',
//       featuredImage: json['featured_image'] ?? '',
//       images: List<String>.from(json['images'] ?? []),
//       salePrice: json['sale_price']?.toDouble() ?? 0.0,
//       mrp: json['mrp']?.toDouble() ?? 0.0,
//       inWishlist: json['in_wishlist'] ?? false,
//       available: json['available'] ?? false,
//       availableFrom: json['available_from'] ?? '',
//       availableTo: json['available_to'] ?? '',
//       productType: json['product_type'] ?? '',
//       discount: double.tryParse(json['discount']?.toString() ?? '0.0') ?? 0.0,
//       stock: json['stock'] ?? 0,
//       isActive: json['is_active'] ?? false,
//       taxRate: json['tax_rate']?.toDouble() ?? 0.0,
//       addons: (json['addons'] as List<dynamic>?)
//               ?.map((e) => Addon.fromJson(e))
//               .toList() ??
//           [],
//     );
//   }

//   static List<Product> fromJsonList(List<dynamic> jsonList) {
//     return jsonList.map((json) => Product.fromJson(json)).toList();
//   }
// }

// class Addon {
//   final int id;
//   final double price;
//   final String name;
//   final String description;
//   final String featuredImage;
//   final int stock;
//   final bool isActive;
//   final double taxRate;

//   Addon({
//     required this.id,
//     required this.price,
//     required this.name,
//     required this.description,
//     required this.featuredImage,
//     required this.stock,
//     required this.isActive,
//     required this.taxRate,
//   });

//   factory Addon.fromJson(Map<String, dynamic> json) {
//     return Addon(
//       id: json['id'],
//       price: json['price']?.toDouble() ?? 0.0,
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//       featuredImage: json['featured_image'] ?? '',
//       stock: json['stock'] ?? 0,
//       isActive: json['is_active'] ?? false,
//       taxRate: json['tax_rate']?.toDouble() ?? 0.0,
//     );
//   }
// }

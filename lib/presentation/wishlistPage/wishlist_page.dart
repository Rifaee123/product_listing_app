import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/presentation/wishlistPage/controller/wishlist_controller.dart';
import 'package:product_listing_app/widgets/product_card.dart';

class WishlistPage extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist")),
      body: Obx(() {
        if (wishlistController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (wishlistController.wishlistItems.isEmpty) {
          return Center(child: Text("No products in your wishlist"));
        }

        return GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.8,
          ),
          itemCount: wishlistController.wishlistItems.length,
          itemBuilder: (context, index) {
            var product = wishlistController.wishlistItems[index];

            return ProductCard(product: product);
          },
        );
      }),
    );
  }
}

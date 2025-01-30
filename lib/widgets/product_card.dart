import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/model/product_model/product_model.dart';
import 'package:product_listing_app/presentation/wishlistPage/controller/wishlist_controller.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product; // Use ProductModel here
  final WishlistController wishlistController = Get.find();

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Card(
        child: Column(
          children: [
            Container(
              height: 140,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      product.featuredImage ?? "", // Use correct property
                    ),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 120, bottom: 100),
                child: InkWell(
                  onTap: () {
                    wishlistController.toggleWishlist(product.id!);
                  },
                  child: Icon(Icons.favorite,
                      color: product.inWishlist == true
                          ? Colors.blueAccent
                          : Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '₹999',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '₹${product.mrp}', // Use correct property
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Text('4.5'),
                        ],
                      ),
                    ],
                  ),
                  Text(product.name ?? "No Name",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

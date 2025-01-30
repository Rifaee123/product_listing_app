import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:product_listing_app/core/auth_helper.dart';
import 'package:product_listing_app/model/product_model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistController extends GetxController {
  var wishlistItems = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWishlist();
  }

  // Fetch the wishlist items
  Future<void> fetchWishlist() async {
    isLoading.value = true;
    final token = await AuthHelper.getToken();

    if (token == null) {
      Get.snackbar("Error", "You need to log in first", backgroundColor: Colors.red);
      isLoading.value = false;
      return;
    }

    final response = await http.get(
      Uri.parse('https://admin.kushinirestaurant.com/api/wishlist/'),
      headers: {'Authorization': 'Bearer $token'},
    );
    log(response.body);
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body) as List;
      wishlistItems.value = jsonData.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      Get.snackbar("Error", "Failed to load wishlist", backgroundColor: Colors.red);
    }

    isLoading.value = false;
  }

  // Toggle the wishlist item (add/remove)
  Future<void> toggleWishlist(int productId) async {
    final token = await AuthHelper.getToken();

    if (token == null) {
      Get.snackbar("Error", "You need to log in first", backgroundColor: Colors.red);
      return;
    }

    final response = await http.post(
      Uri.parse('https://admin.kushinirestaurant.com/api/add-remove-wishlist/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"product_id": productId}),
    );

    log(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      fetchWishlist();
      String message = jsonDecode(response.body)['message'];
      Get.snackbar("Wishlist", message, backgroundColor: Colors.green);
    }
  }
}

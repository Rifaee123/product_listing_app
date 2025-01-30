import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:product_listing_app/model/product_model/product_model.dart';

class HomeController extends GetxController {
  var products = <ProductModel>[].obs;
  var banners = [].obs;
  var isLoading = false.obs;
  var isBannerLoading = false.obs;
  var token = ''.obs;
  var wishlist = <int>{}.obs;

  @override
  void onInit() {
    // verifyUser();
    fetchProducts();
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://admin.kushinirestaurant.com/api/products/'),
      );

      if (response.statusCode == 200) {
        log(response.body);
        var jsonData = jsonDecode(response.body) as List;

        products.value = jsonData.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        debugPrint("Failed to fetch products: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }

  void fetchBanners() async {
    try {
      isBannerLoading(true);
      final response = await http.get(
        Uri.parse('https://admin.kushinirestaurant.com/api/banners/'),
      );

      if (response.statusCode == 200) {
        banners.value = jsonDecode(response.body);
      } else {
        Get.snackbar("Error", "Failed to load banners",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      log("Error fetching banners: $e");
    } finally {
      isBannerLoading(false);
    }
  }
}

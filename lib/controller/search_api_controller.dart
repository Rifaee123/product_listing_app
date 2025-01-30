import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:product_listing_app/model/product_model/product_model.dart';

class SearchController1 extends GetxController {
  var searchQuery = ''.obs;
  var products = <ProductModel>[].obs;
  var isLoading = false.obs;

  // Update the search query and fetch the results
  void updateSearchQuery(String query) {
    searchQuery.value = query;
    fetchSearchResults(query);
  }

  // Fetch search results from API
  Future<void> fetchSearchResults(String query) async {
    if (query.isEmpty) {
      products.clear();
      return;
    }

    isLoading.value = true;
    final response = await http.post(
      Uri.parse('https://admin.kushinirestaurant.com/api/search/'),
      body: jsonEncode({"query": query}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data is List) {
        products.value = data.map((e) => ProductModel.fromJson(e)).toList();
      }
    } else {
      products.clear();
    }

    isLoading.value = false;
  }
}

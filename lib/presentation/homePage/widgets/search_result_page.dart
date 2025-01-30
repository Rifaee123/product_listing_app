import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/controller/search_api_controller.dart';

class SearchResultsPage extends StatelessWidget {
  final SearchController1 searchController =
      Get.find<SearchController1>(); // Get the SearchController
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Focus the TextField when the page is built
    Future.delayed(Duration.zero, () {
      focusNode.requestFocus();
    });

    return Scaffold(
      appBar: AppBar(title: Text("Search Results")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              focusNode: focusNode, // Set the focus node to the TextField
              decoration: InputDecoration(
                hintText: "Search for products...",
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                searchController.updateSearchQuery(
                    query); // Update the search query as user types
              },
            ),
            SizedBox(height: 20),
            Obx(() {
              // Check if the query has products
              if (searchController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (searchController.products.isEmpty) {
                return Center(child: Text("No products found"));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: searchController.products.length,
                  itemBuilder: (context, index) {
                    var product = searchController.products[index];
                    return ListTile(
                      title: Text(product.name ?? "No Name"),
                      subtitle: Text("₹${product.mrp}"),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

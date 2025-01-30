import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/controller/search_api_controller.dart';
import 'package:product_listing_app/presentation/homePage/controller/home_controller.dart';
import 'package:product_listing_app/presentation/homePage/widgets/search_result_page.dart';
import 'package:product_listing_app/widgets/product_card.dart';

class HomePage1 extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final SearchController1 searchController =
      Get.put(SearchController1()); // Get search controller
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(32, 0, 0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0.02)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: textController,
                              focusNode:
                                  focusNode, // Set the focus node to the TextField
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for products...",
                                suffixIcon: Icon(Icons.search),
                              ),
                              onChanged: (query) {
                                searchController.updateSearchQuery(
                                    query); // Update the search query as user types
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Obx(() {
                          // Check if the query has products
                          if (searchController.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (searchController.products.isEmpty) {
                            return Center(
                                child: Text("No search products found"));
                          }
                          return SizedBox(
                            height: 200,
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
                ],
              ),
            ),
            BannerSlider(),
            Text("Popular Products"),
            // Ensure the grid view is wrapped with an Expanded widget to fill available space
            Expanded(
              child: Obx(() {
                if (homeController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (homeController.products.isEmpty) {
                  return Center(child: Text("No products available"));
                }
                return GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: homeController.products.length,
                  itemBuilder: (context, index) {
                    final product = homeController.products[index];
                    return ProductCard(product: product);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerSlider extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isBannerLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (homeController.banners.isEmpty) {
        return Center(child: Text("No banners available"));
      }

      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 150,
          child: PageView.builder(
            itemCount: homeController.banners.length,
            itemBuilder: (context, index) {
              var banner = homeController.banners[index];
              var imageUrl = banner['image'] ?? "";

              return imageUrl.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: NetworkImage(
                            imageUrl,
                          ))),
                    )
                  : Center(child: Text("Image not available"));
            },
          ),
        ),
      );
    });
  }
}

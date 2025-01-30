import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/controller/profile_api_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    // Fetch user profile when the screen is initialized
    profileController.fetchUserProfile();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(() {
            if (profileController.name.value.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${profileController.name.value}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Phone Number: ${profileController.phoneNumber.value}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

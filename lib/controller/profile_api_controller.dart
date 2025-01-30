import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:product_listing_app/core/auth_helper.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var phoneNumber = ''.obs;

  // Fetch user profile using the JWT token
  Future<void> fetchUserProfile() async {
    String? token = await AuthHelper.getToken();
    if (token != null) {
      try {
        final response = await http.get(
          Uri.parse(
              'https://admin.kushinirestaurant.com/api/user-data/'), // Replace with your Profile API URL
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          name.value = data['name'];
          phoneNumber.value = data['phone_number'];
        } else {
          Get.snackbar("Error", "Failed to load profile.");
        }
      } catch (e) {
        log(e.toString());
        Get.snackbar("Error", "An error occurred while fetching the profile.");
      }
    } else {
      Get.snackbar("Error", "No token found, please login.");
    }
  }
}

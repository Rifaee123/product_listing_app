import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:product_listing_app/core/auth_helper.dart';
import 'package:product_listing_app/presentation/homePage/home_page1.dart';
import 'package:product_listing_app/presentation/loginPage/widgets/Otp_page1.dart';
import 'package:product_listing_app/widgets/bottemnavigation.dart';

class LoginController extends GetxController {
  var phoneNumber = ''.obs;
  var otp = ''.obs;
  var token = ''.obs;
  RxBool userExists = false.obs;
  var massage = ''.obs;

  Future<void> verifyUser() async {
    try {
      final response = await http.post(
        Uri.parse('https://admin.kushinirestaurant.com/api/verify/'),
        body: jsonEncode({"phone_number": phoneNumber.value}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        log(response.body);
        final data = jsonDecode(response.body);

        otp.value = data['otp'];
        userExists.value = data['user'];

        // Navigate to OtpScreen regardless of userExists value
        Get.to(() => OtpPage1());

        if (userExists.value) {
          log("User exists");
          if (data['token'] != null && data['token']['access'] != null) {
            token.value = data['token']['access'];
            await AuthHelper.saveToken(token.value);
            final token1 = await AuthHelper.getToken();
            log("token saved");
            log(token1.toString());
          } else {
            log("Token is null, cannot save token.");
          }
        } else {
          log("User does not exist.");
        }
      } else {
        log("Error: Response status code is not 200. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error occurred while verifying user: $e");
    }
  }

  Future<void> loginOrRegister(String name) async {
    final response = await http.post(
      Uri.parse('https://admin.kushinirestaurant.com/api/login-register/'),
      body: jsonEncode({"first_name": name, "phone_number": phoneNumber.value}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      log(response.body);
      final data = jsonDecode(response.body);
      // token.value = data['token']['access'];
      if (data['message'] == "Login Successful") {
        log("Login Successful");
        if (data['token'] != null && data['token']['access'] != null) {
          token.value = data['token']['access'];
          await AuthHelper.saveToken(token.value);
          final token1 = await AuthHelper.getToken();
          log("token saved");
          log(token1.toString());
        } else {
          log("Token is null, cannot save token.");
        }
      } else {
        log("User does not exist.");
      }
      Get.offAll(() => BottemnavigationPage());
    }
  }
}

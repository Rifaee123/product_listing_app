import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/controller/login_api_controller.dart';
import 'package:product_listing_app/presentation/loginPage/widgets/Otp_page1.dart';

class LoginPage1 extends StatelessWidget {
  final LoginController loginController =
      Get.put(LoginController()); // Initialize the controller

  LoginPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                "Let's Connect With Lorem lpsum.!",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 145, 144, 144),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: const Color.fromARGB(255, 167, 167, 167),
                        ),
                      ),
                    ),
                    child: const Center(child: Text("+91")),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 250,
                    height: 50,
                    child: TextField(
                      decoration:
                          const InputDecoration(hintText: "Enter Phone"),
                      onChanged: (value) {
                        loginController.phoneNumber.value =
                            value; // Update phone number in the controller
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () async {
                    await loginController
                        .verifyUser(); // Call the verifyUser method
                  },
                  child: Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 290,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'By Continuing You accepting the ',
                          style: TextStyle(
                            fontFamily: "EudoxusSans",
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Use &',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontFamily: "EudoxusSansBold",
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: "EudoxusSansBold",
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

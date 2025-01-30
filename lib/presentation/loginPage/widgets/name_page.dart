import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/controller/login_api_controller.dart';

class NamePage extends StatelessWidget {
  NamePage({super.key});

  final LoginController loginController =
      Get.find<LoginController>(); // GetX Controller instance
  final TextEditingController nameController =
      TextEditingController(); // Controller for name input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(104, 0, 0, 0),
                        spreadRadius: 0.07,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Center(child: Icon(Icons.arrow_back)),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Enter Full Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController, // Assign controller
                decoration: InputDecoration(
                  hintText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    String name = nameController.text.trim();
                    if (name.isNotEmpty) {
                      loginController.loginOrRegister(name); // API call
                    } else {
                      Get.snackbar(
                        "Error",
                        "Please enter your full name.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
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
            ],
          ),
        ),
      ),
    );
  }
}

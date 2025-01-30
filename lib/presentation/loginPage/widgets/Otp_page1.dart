import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/controller/login_api_controller.dart';

import 'package:product_listing_app/presentation/homePage/home_page1.dart';
import 'package:product_listing_app/presentation/loginPage/widgets/name_page.dart';
import 'package:product_listing_app/widgets/bottemnavigation.dart';

class OtpPage1 extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();

  final RxString enteredOtp = ''.obs; // Store entered OTP
  final RxBool isOtpValid = false.obs; // Track OTP validity

  OtpPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
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
                      borderRadius: BorderRadius.circular(8),
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
                  "OTP VERIFICATION",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      const TextSpan(
                        text: 'Enter the OTP sent to - ',
                        style: TextStyle(
                            fontFamily: "EudoxusSans", color: Colors.black),
                      ),
                      TextSpan(
                        text: '+91-${loginController.phoneNumber.value}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "EudoxusSansBold",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      const TextSpan(
                        text: 'OTP is ',
                        style: TextStyle(
                            fontFamily: "EudoxusSans",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: '${loginController.otp.value}',
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontFamily: "EudoxusSansBold"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                OtpTextField(
                  fieldWidth: 70,
                  numberOfFields: 4,
                  borderColor: const Color(0xFF512DA8),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    enteredOtp.value = code;
                    isOtpValid.value =
                        (enteredOtp.value == loginController.otp.value);
                  },
                  onSubmit: (String verificationCode) {
                    enteredOtp.value = verificationCode;
                    isOtpValid.value =
                        (enteredOtp.value == loginController.otp.value);
                  },
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text("00:120 Sec",
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal)),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Don’t receive code? ',
                          style: TextStyle(
                              fontFamily: "EudoxusSans",
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Re_send',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontFamily: "EudoxusSansBold"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Obx(() => Center(
                      child: InkWell(
                        onTap: isOtpValid.value
                            ? () {
                                if (loginController.userExists.value == true) {
                                  Get.offAll(() => BottemnavigationPage());
                                } else {
                                  Get.to(() => NamePage());
                                }
                              }
                            : null, // Disable tap when OTP is invalid
                        child: Container(
                          width: 360,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isOtpValid.value
                                ? Colors.blueAccent
                                : Colors.grey, // Dynamic button color
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

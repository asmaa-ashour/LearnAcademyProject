import 'package:second/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustombuttonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustombuttonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      //  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
      width: 300,
      // double.infinity,
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        child: const Text(
          'Continue',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
/*                     Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        //  elevation: Alignment(1, 2),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 100),
        textColor: Colors.white,
        color: AppColor.prrimaryColor,
        onPressed: () {
          controller.next();
        },
        child: const Text(
          "Continue",
        ),
      ),
    );
*/
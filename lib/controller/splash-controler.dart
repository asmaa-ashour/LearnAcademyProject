import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed('/onboarding');
      //lang when repear shearedpreferance
    });
  }
}

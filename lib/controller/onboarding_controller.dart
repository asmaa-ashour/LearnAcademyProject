import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  late PageController pageController;
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  @override
  next() {
    if (currentPage < 2) { // عدّل العدد حسب عدد صفحات onboarding
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offNamed('/logIn');
    }

  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }


  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}

import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0; // الفهرس الحالي

  void changeIndex(int index) {
    currentIndex = index;
    update(); // تحديث الواجهة
  }
}


/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screen/home_page.dart';
import '../../view/screen/home_page/homepage.dart';
import '../../view/screen/personal_profile/personal_profile.dart';
import '../../view/screen/recommendationScreen.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  int home = 0;
  int setting = 1;
  int lang = 2;
  int fav = 3;

  List<Widget> ListPage = [
    HomeScreen(),
    ProfileViewScreen(),
    RecommendationScreen(),
    HomePage(),
  ];
  List ButtomAppBAr = [
    {'title': "home", 'icon': Icons.home},
    {'title': "settings", 'icon': Icons.settings},
    {'title': "favorite", 'icon': Icons.favorite},
    {'title': "Language", 'icon': Icons.language},
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}*/

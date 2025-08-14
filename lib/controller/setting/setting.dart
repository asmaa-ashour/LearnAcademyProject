//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../core/constant/constant_data.dart';
// import '../../core/constant/routs.dart';
// import '../../link_app.dart';
//
// abstract class SettingPageController extends GetxController {
//   goToPersonalProfile();
//   goToEditPersonalProfile();
//   deletAccountButton();
//   logoutButton();
//   changhThem();
//   goToHotelPage();
//   goToResturantPage();
//   goToChargingPage();
// }
//
// class SettingPageControllerImp extends SettingPageController {
//   @override
//   deletAccountButton() async {
//     Get.defaultDialog(
//         title: "Alert",
//         middleText: "Are you sure need delet your account??",
//         actions: [
//           ElevatedButton(
//               onPressed: () async {
//                 dynamic data = await Api().delet(
//                     url: "${AppLink.serverLink}/auth/users/$id",
//                     body: {},
//                     token: Token);
//
//                 if (data['message'] == 'user deleted successfully') {
//                   Get.offNamed(AppRoute.logIn);
//                 } else {
//                   print("Unauthenticated.");
//                 }
//                 update();
//               },
//               child: Text("Yes")),
//           ElevatedButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: Text("No"))
//         ]);
//   }
//
//   @override
//   goToEditPersonalProfile() {
//     Get.toNamed(AppRoute.editPersonalProfile);
//   }
//
//   @override
//   goToPersonalProfile() {
//     Get.toNamed(AppRoute.personalProfile);
//   }
//
//   @override
//   logoutButton() async {
//     Get.defaultDialog(
//         title: "Aleart",
//         middleText: "Are you sure you need log out??",
//         actions: [
//           ElevatedButton(
//               onPressed: () async {
//                 dynamic data = await Api().post(
//                     url: "${AppLink.serverLink}/auth/logout",
//                     body: {},
//                     token: Token);
//                 print("$Token");
//                 if (data['message'] == 'Successfully logged out') {
//                   Get.offNamed(AppRoute.logIn);
//                 } else {
//                   print("Unauthenticated.");
//                 }
//                 update();
//               },
//               child: Text("Yes")),
//           ElevatedButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: Text("No"))
//         ]);
//   }
//
//   @override
//   changhThem() {
//     if (Get.isDarkMode) {
//       Get.changeTheme(Themes.customLightTheme);
//       myServices.sharedPreferences.setString("theme", "light");
//     } else {
//       Get.changeTheme(Themes.customDarkTheme);
//       myServices.sharedPreferences.setString("theme", "dark");
//     }
//   }
//
//   @override
//   goToHotelPage() {
//     Get.toNamed(AppRoute.hotelPage);
//   }
//
//   @override
//   goToResturantPage() {
//     Get.toNamed(AppRoute.resturantPage);
//   }
//
//   @override
//   goToChargingPage() {
//     Get.toNamed(AppRoute.chargingbalance);
//   }
// }

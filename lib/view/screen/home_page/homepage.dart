// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:second/view/screen/recommendationScreen.dart';
// import '../../../controller/HomePage/home_screen_controller.dart';
// //import '../../widget/home/custombuttonappbar.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeScreenControllerImp());
//     return GetBuilder<HomeScreenControllerImp>(
//       builder: (controller) => Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Get.to(RecommendationScreen());
//           },
//           child: const Icon(Icons.shopping_basket_outlined),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       //  bottomNavigationBar: const CustomButtomAppBarHome(),
//         body: controller.ListPage.elementAt(controller.currentPage),
//       ),
//     );
//   }
// }

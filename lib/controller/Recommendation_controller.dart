import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../core/constant/constant_data.dart';

class RecommendationController extends GetxController
    with SingleGetTickerProviderMixin {
  TextEditingController interestController = TextEditingController();
  bool isLoading = false;
  List<Map<String, dynamic>> recommendedCourses = [];

  // Animation
  late AnimationController animController;
  late Animation<double> fadeAnim;
  late Animation<Offset> slideAnim;

  @override
  void onInit() {
    super.onInit();

    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    fadeAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animController, curve: Curves.easeIn),
    );

    slideAnim = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: animController, curve: Curves.easeOut),
    );

    animController.forward();
  }

  @override
  void onClose() {
    interestController.dispose();
    animController.dispose();
    super.onClose();
  }

  Future<void> sendRecommendation() async {
    final interest = interestController.text.trim();
    if (interest.isEmpty || interest.length < 3) {
      Get.snackbar("خطأ", "الرجاء كتابة الاهتمام بشكل صحيح",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      isLoading = true;
      recommendedCourses.clear();
      update(); // تحديث الواجهة

      var url = Uri.parse("http://10.0.2.2:8000/api/student/send-recomendation");
      var response = await http.post(
        url,
        headers: {
          "Authorization": "$Token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"interest": interest}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["data"] != null && data["data"] is List) {
          recommendedCourses =
          List<Map<String, dynamic>>.from(data["data"]);
        }

        Get.snackbar("نجاح 🎉", "تم جلب التوصيات بنجاح",
            backgroundColor: Colors.green, colorText: Colors.white);

        interestController.clear();
      } else {
        Get.snackbar("خطأ ❌",
            "فشل في جلب التوصيات، الكود: ${response.statusCode}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("خطأ ❌", "حدث خطأ: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading = false;
      update(); // تحديث الواجهة بعد انتهاء التحميل
    }
  }
}
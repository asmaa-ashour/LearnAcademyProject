// controllers/complaint_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/ComplaintModel.dart';
import '../services/ComplaintService.dart';

class ComplaintController extends GetxController {
  var complaints = <Complaint>[].obs;
  var isLoading = false.obs;

  Future<void> fetchComplaints(String token) async {
    isLoading.value = true;
    complaints.value = await ApiService.getComplaints(token);
    isLoading.value = false;
  }

  Future<void> addComplaint({
    required String type,
    required String description,
    required String department,
    required String location,
    required List<String> photoPaths,
  }) async {
    try {
      isLoading.value = true;

      var complaint = await ApiService.addComplaint(
        type: type,
        description: description,
        department: department,
        location: location,
        photoPaths: photoPaths,
      );

      if (complaint != null) {
        complaints.add(complaint); // تحديث الـ UI تلقائيًا

        // عرض Snackbar بنجاح
        Get.snackbar(
          'نجاح',
          'تم إرسال الشكوى بنجاح',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF4CAF50),
          colorText: const Color(0xFFFFFFFF),
          duration: const Duration(seconds: 3),
        );
      } else {
        // في حال فشل الإرسال
        Get.snackbar(
          'خطأ',
          'حدث خطأ أثناء إرسال الشكوى',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFF44336),
          colorText: const Color(0xFFFFFFFF),
          duration: const Duration(seconds: 3),
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}

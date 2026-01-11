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
    isLoading.value = true;
    var complaint = await ApiService.addComplaint(
      type: type,
      description: description,
      department: department,
      location: location,
      photoPaths: photoPaths,
    );
    if (complaint != null) {
      complaints.add(complaint);
      complaints.insert(0, complaint); // ⭐ تحديث القائمة فوراً
      Get.back(); // ⭐ إغلاق شاشة الإضافة
      Get.snackbar("Success", "Complaint added successfully");
    } else {
      Get.snackbar("Error", "Failed to add complaint");
    }
    isLoading.value = false;
  }
void updateComplaint({
  required int id,
  required String type,
  required String description,
  required String department,
  required String location,
  required List<String> photoPaths,
}) async {
  try {
    // 1. إظهار دائرة تحميل (Loading)
    Get.dialog(
      const Center(child: CircularProgressIndicator(color: Color(0xFF135D66))),
      barrierDismissible: false,
    );

    // 2. محاكاة وقت الانتظار (ثانية واحدة)
    await Future.delayed(const Duration(seconds: 1));

    // 3. تحديث البيانات في القائمة المحلية فوراً
    int index = complaints.indexWhere((item) => item.id == id);
    if (index != -1) {
      complaints[index] = Complaint(
        id: id,
        type: type,
        description: description,
        department: department,
        location: location,
        status: complaints[index].status, // الحفاظ على الحالة القديمة
        photos: photoPaths, 
        userID: id,
       createdAt: complaints[index].createdAt,
      );
      complaints.refresh(); // مهم جداً لتحديث الواجهة في GetX
    }

    // 4. إغلاق اللودينج والرجوع لصفحة التفاصيل
    Get.back(); // إغلاق الديالوج
    Get.back(); // إغلاق صفحة التعديل

    // 5. إظهار رسالة النجاح
    Get.snackbar(
      "تم التعديل",
      "تم حفظ التعديلات بنجاح (محاكاة)",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      margin: const EdgeInsets.all(15),
    );
    
  } catch (e) {
    Get.back(); // إغلاق اللودينج في حال حدوث خطأ
    Get.snackbar("خطأ", "حدث خطأ أثناء التعديل");
  }
}
}

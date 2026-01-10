// controllers/complaint_controller.dart
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

  Future<void> updateComplaint({
  required int id,
  required String type,
  required String description,
  required String department,
  required String location,
  required List<String> photoPaths,
}) async {
  isLoading.value = true;

  var updatedComplaint = await ApiService.updateComplaint(
    id: id,
    type: type,
    description: description,
    department: department,
    location: location,
    photoPaths: photoPaths,
  );

  if (updatedComplaint != null) {
    int index = complaints.indexWhere((c) => c.id == id);
    if (index != -1) {
      complaints[index] = updatedComplaint; // تحديث القائمة
    }

    Get.back();
    Get.snackbar("Success", "Complaint updated successfully");
  } else {
    Get.snackbar("Error", "Failed to update complaint");
  }

  isLoading.value = false;
}

}

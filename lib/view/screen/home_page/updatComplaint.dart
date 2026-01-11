import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second/controller/ComplaintController.dart';
import 'package:second/data/model/ComplaintModel.dart';

class UpdateComplaintView extends StatelessWidget {
  final Complaint complaint;
  UpdateComplaintView({super.key, required this.complaint});

  final ComplaintController controller = Get.find();

  // تعريف التكست كنترولر مع البيانات القديمة
  late final TextEditingController descController =
      TextEditingController(text: complaint.description);
  late final TextEditingController locationController =
      TextEditingController(text: complaint.location);

  final List<String> complaintTypes = [
    "صحة",
    "بيئة",
    "مرور",
    "أمن",
    "خدمات عامة",
    "تعليم",
    "مرافق عامة",
    "شكوى أخرى"
  ];

  final List<Map<String, String>> departments = [
    {'key': 'Interior', 'label': 'الداخلية'},
    {'key': 'Health', 'label': 'الصحة'},
    {'key': 'Education', 'label': 'التربية'},
    {'key': 'Justice', 'label': 'العدل'},
    {'key': 'AntiCorruption', 'label': 'مكافحة الفساد'},
    {'key': 'Communications', 'label': 'الاتصالات'},
    {'key': 'Labor', 'label': 'العمل'},
    {'key': 'ConsumerProtection', 'label': 'حماية المستهلك'},
  ];

  final RxString selectedType = "".obs;
  final RxString selectedDepartment = "".obs;
  final RxList<XFile> selectedImages = <XFile>[].obs;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    if (selectedType.value.isEmpty) {
      selectedType.value = complaintTypes.contains(complaint.type)
          ? complaint.type
          : complaintTypes[0];
    }

    if (selectedDepartment.value.isEmpty) {
      bool deptExists =
          departments.any((d) => d['key'] == complaint.department);
      selectedDepartment.value = deptExists ? complaint.department : 'Health';
    }

    // --- صمام الأمان (Validation) ---
    // التأكد أن النوع القادم موجود في القائمة العربية، وإلا اختر "صحة" كافتراضي
    selectedType.value = complaintTypes.contains(complaint.type)
        ? complaint.type
        : complaintTypes[0];

    // التأكد أن القسم القادم موجود في المفاتيح، وإلا اختر "Health" كافتراضي
    bool deptExists = departments.any((d) => d['key'] == complaint.department);
    selectedDepartment.value = deptExists ? complaint.department : 'Health';

    return Directionality(
      textDirection: TextDirection.rtl, // لضمان ظهور اللغة العربية بشكل صحيح
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F8),
        body: Column(
          children: [
            // ===== Header =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF003C43), Color(0xFF135D66)]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.edit, color: Colors.white, size: 34),
                  SizedBox(width: 12),
                  Text("تعديل الشكوى",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),

            // ===== Form =====
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // نوع الشكوى
                        Obx(() => DropdownButtonFormField<String>(
                              value: selectedType.value,
                              decoration: _inputDecoration(
                                  "نوع الشكوى", Icons.category),
                              items: complaintTypes
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (val) => selectedType.value = val!,
                            )),
                        const SizedBox(height: 16),

                        // الوصف
                        TextField(
                          controller: descController,
                          maxLines: 4,
                          decoration:
                              _inputDecoration("الوصف", Icons.description),
                        ),
                        const SizedBox(height: 16),

                        // القسم
                        Obx(() => DropdownButtonFormField<String>(
                              value: selectedDepartment.value,
                              decoration:
                                  _inputDecoration("القسم", Icons.apartment),
                              items: departments
                                  .map((d) => DropdownMenuItem(
                                      value: d['key'],
                                      child: Text(d['label']!)))
                                  .toList(),
                              onChanged: (value) =>
                                  selectedDepartment.value = value!,
                            )),
                        const SizedBox(height: 16),

                        // الموقع
                        TextField(
                          controller: locationController,
                          decoration:
                              _inputDecoration("الموقع", Icons.location_on),
                        ),
                        const SizedBox(height: 20),

                        // عرض الصور المختارة
                        Obx(() => selectedImages.isNotEmpty
                            ? Wrap(
                                spacing: 8,
                                children: selectedImages
                                    .map((image) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.file(File(image.path),
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover),
                                        ))
                                    .toList(),
                              )
                            : const SizedBox()),

                        const SizedBox(height: 10),

                        OutlinedButton.icon(
                          onPressed: () async {
                            final List<XFile>? images =
                                await picker.pickMultiImage();
                            if (images != null) selectedImages.addAll(images);
                          },
                          icon: const Icon(Icons.add_a_photo),
                          label: const Text("إضافة صور للمرفقات"),
                        ),

                        const SizedBox(height: 30),

                        // زر الحفظ
                        GestureDetector(
                          onTap: () {
                            controller.updateComplaint(
                              id: complaint.id!,
                              type: selectedType.value,
                              description: descController.text,
                              department: selectedDepartment.value,
                              location: locationController.text,
                              photoPaths:
                                  selectedImages.map((e) => e.path).toList(),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color(0xFF6A994E),
                                Color(0xFF386641)
                              ]),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: Text("حفظ التعديلات",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    );
  }
}

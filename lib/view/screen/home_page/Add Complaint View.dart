import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/ComplaintController.dart';

class AddComplaintView extends StatelessWidget {
  final ComplaintController controller = Get.put(ComplaintController());

  final descController = TextEditingController();
  final locationController = TextEditingController();
  //final departmentController = TextEditingController();

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

  final RxString selectedType = "صحة".obs;
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
  final RxString selectedDepartment = 'Health'.obs;
  final RxList<XFile> selectedImages = <XFile>[].obs;

  final ImagePicker picker = ImagePicker();

  Future<void> pickImages() async {
    final images = await picker.pickMultiImage(imageQuality: 70);
    if (images != null) {
      selectedImages.assignAll(images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: Column(
        children: [
          // ===== Header =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF003C43), Color(0xFF135D66)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Row(
              children: const [
                Icon(Icons.edit_document, color: Colors.white, size: 36),
                SizedBox(width: 12),
                Text(
                  "تقديم شكوى",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
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
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // نوع الشكوى
                      Obx(() => DropdownButtonFormField<String>(
                            value: selectedType.value,
                            isExpanded: true, // لضمان عدم خروج النص عن الحواف
                            icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Color(0xFF135D66)),
                            decoration: _inputDecoration(
                                "نوع الشكوى", Icons.category_rounded),
                            items: complaintTypes
                                .map((type) => DropdownMenuItem(
                                      value: type,
                                      child: Text(type,
                                          style: const TextStyle(fontSize: 15)),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value != null) selectedType.value = value;
                            },
                          )),
                      const SizedBox(height: 16),

                      // الوصف
                      TextField(
                        controller: descController,
                        maxLines: 4,
                        decoration:
                            _inputDecoration("وصف الشكوى", Icons.description),
                      ),
                      const SizedBox(height: 16),

                      // القسم
                      Obx(() => DropdownButtonFormField<String>(
                            value: selectedDepartment.value,
                            isExpanded: true,
                            icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Color(0xFF135D66)),
                            decoration: _inputDecoration(
                                "الجهة المختصة (القسم)",
                                Icons.account_balance_rounded),
                            items: departments
                                .map((d) => DropdownMenuItem(
                                      value: d['key'],
                                      child: Text(d['label']!,
                                          style: const TextStyle(fontSize: 15)),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value != null)
                                selectedDepartment.value = value;
                            },
                          )),
                      const SizedBox(height: 16),

                      // الموقع
                      TextField(
                        controller: locationController,
                        decoration:
                            _inputDecoration("الموقع", Icons.location_on),
                      ),
                      const SizedBox(height: 20),

                      // الصور
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "إرفاق صور (اختياري)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      OutlinedButton.icon(
                        onPressed: pickImages,
                        icon: const Icon(Icons.photo_library),
                        label: const Text("اختيار صور"),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Obx(() => selectedImages.isEmpty
                          ? const Text("لم يتم اختيار صور")
                          : SizedBox(
                              height: 110,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: selectedImages.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.file(
                                            File(selectedImages[index].path),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 2,
                                        right: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            selectedImages.removeAt(index);
                                          },
                                          child: const CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.red,
                                            child: Icon(Icons.close,
                                                size: 14, color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            )),

                      const SizedBox(height: 30),

                      // زر الإرسال
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF00B4D8),
                              Color(0xFF0077B6),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.addComplaint(
                              type: selectedType.value,
                              description: descController.text,
                              department: selectedDepartment.value,
                              location: locationController.text,
                              photoPaths:
                                  selectedImages.map((x) => x.path).toList(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            "إرسال الشكوى",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
          color: Color(0xFF003C43), fontWeight: FontWeight.w500),
      prefixIcon: Icon(icon, color: const Color(0xFF135D66)),
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16), // زوايا أنعم
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: Colors.grey.shade200, width: 1), // حدود خفيفة جداً
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
            color: Color(0xFF135D66), width: 1.5), // تحديد عند الكتابة
      ),
    );
  }
}

// views/add_complaint_view.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/ComplaintController.dart';


class AddComplaintView extends StatelessWidget {
  final ComplaintController controller = Get.put(ComplaintController());

  final descController = TextEditingController();
  final departmentController = TextEditingController();
  final locationController = TextEditingController();

  // قائمة أنواع الشكاوى
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

  // نوع الشكوى المختار
  final RxString selectedType = "صحة".obs;

  // قائمة الصور المختارة
  final RxList<XFile> selectedImages = <XFile>[].obs;

  final ImagePicker picker = ImagePicker();

  // دالة لاختيار الصور
  Future<void> pickImages() async {
    final List<XFile>? images = await picker.pickMultiImage(
      imageQuality: 70, // ضغط الصورة لتقليل الحجم
    );
    if (images != null) {
      selectedImages.assignAll(images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF002623),title: const Text('تقديم شكوى',style: TextStyle(color: Colors.black))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => DropdownButtonFormField<String>(
                    value: selectedType.value,
                    decoration: const InputDecoration(
                      labelText: 'نوع الشكوى',
                      border: OutlineInputBorder(),
                    ),
                    items: complaintTypes
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) selectedType.value = value;
                    },
                  )),
              const SizedBox(height: 16),
              TextField(
                controller: descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'وصف الشكوى',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: departmentController,
                decoration: const InputDecoration(
                  labelText: 'القسم',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: 'الموقع',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // زر اختيار الصور
              ElevatedButton.icon(
                onPressed: pickImages,
                icon: const Icon(Icons.photo_library),
                label: const Text('اختيار صور'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 10),
              // عرض الصور المختارة
              Obx(() => selectedImages.isEmpty
                  ? const Text('لم يتم اختيار أي صور')
                  : SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.file(
                              File(selectedImages[index].path),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // تحويل XFile إلى مسارات
                  List<String> photoPaths =
                      selectedImages.map((xfile) => xfile.path).toList();
              print(photoPaths.first);
              print("smklajdjaslkdjsalkdjslak");
                  controller.addComplaint(
                    type: selectedType.value,
                    description: descController.text,
                    department: departmentController.text,
                    location: locationController.text,
                    photoPaths: photoPaths,
                  );
                },
                child: const Text('إرسال الشكوى'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

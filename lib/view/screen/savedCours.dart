import 'package:flutter/material.dart';
import '../widget/home/buildCourseCard.dart'; // استدعاء Widget الكورس

class SavedCoursesScreen extends StatelessWidget {
  const SavedCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // بيانات ثابتة مؤقتًا
    final List<Map<String, String>> savedCourses = [
      {
        "title": "دورة التصميم الجرافيكي",
        "status": "محفوظ",
        "image": "https://via.placeholder.com/150"
      },
      {
        "title": "تحليل البيانات",
        "status": "محفوظ",
        "image": "https://via.placeholder.com/150"
      },
      {
        "title": "تعلم Flutter",
        "status": "محفوظ",
        "image": "https://via.placeholder.com/150"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("الكورسات المحفوظة"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: savedCourses.length,
        itemBuilder: (context, index) {
          final course = savedCourses[index];
          return BuildCourseCard(
            title: course["title"] ?? "بدون عنوان",
            status: course["status"] ?? "",
          );
        },
      ),
    );
  }
}

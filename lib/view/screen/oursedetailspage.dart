import 'package:flutter/material.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الدورة'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم الدورة
            const Text(
              'اسم الدورة: تطوير تطبيقات Flutter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // المهارات المطلوبة والمكتسبة
            const Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('المهارات المطلوبة:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- معرفة بأساسيات Dart'),
                    Text('- خبرة في تصميم الواجهات'),
                    SizedBox(height: 8),
                    Text('المهارات المكتسبة:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- بناء واجهات احترافية'),
                    Text('- التعامل مع إدارة الحالة باستخدام GetX'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // مستوى الصعوبة
            const Text('المستوى: متوسط', style: TextStyle(fontSize: 16)),

            const SizedBox(height: 12),

            // حالة التسجيل
            const  Row(
              children: const [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 8),
                Text('الدورة مدفوعة - تتطلب 50 نقطة'),
              ],
            ),
            const SizedBox(height: 20),

            // أزرار التسجيل والحفظ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle),
                  label: const Text('تسجيل في الدورة'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border),
                  label: const Text('مشاهدة لاحقًا'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // زر تقرير المشكلات
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.report_problem),
                label: const Text('تقرير المشكلات'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
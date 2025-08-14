import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/view/screen/savedCours.dart';
import '../../controller/HomePage/home_screen_controller.dart';
import '../widget/home/buildCategoryCard.dart';
import '../widget/home/buildCourseCard.dart';
import 'personal_profile/personal_profile.dart';
import 'recommendationScreen.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    final List<Widget> pages = [
      const HomeContent(),       // الصفحة الرئيسية
      RecommendationScreen(),       // كورساتي
      SavedCoursesScreen(),    // المحفوظات
      ProfileViewScreen(),       // الملف الشخصي
    ];

    return GetBuilder<BottomNavController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.grey[100],
        body: pages[controller.currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.changeIndex,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "الرئيسية"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: "توصياتي"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "المحفوظات"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "الملف الشخصي"),
            ],
          ),
        ),
      ),
    );
  }
}

/// الصفحة الرئيسية كمحتوى فقط
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // شريط البحث
          TextField(
            decoration: InputDecoration(
              hintText: "ابحث عن كورس أو تخصص",
              prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // التخصصات
          const Text("التخصصات",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:const [
                BuildCategoryCard(title:"برمجة",icon: Icons.code),
                BuildCategoryCard(title:"تصميم",icon: Icons.brush),
                BuildCategoryCard(title:"ذكاء اصطناعي",icon: Icons.memory),
                BuildCategoryCard(title:"تسويق",icon: Icons.campaign),

              ],
            ),
          ),
          const SizedBox(height: 20),

          // الكورسات الجارية
          const Text("الكورسات الجارية",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          BuildCourseCard(title:"تعلم Flutter", status: "80%"),
          BuildCourseCard(title:"أساسيات بايثون", status: "50%"),
          const SizedBox(height: 20),

          // الكورسات المحفوظة
          const Text("الكورسات المحفوظة",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          BuildCourseCard(title:"دورة التصميم الجرافيكي", status: "محفوظ"),
          BuildCourseCard(title:"تحليل البيانات", status: "محفوظ"),
          BuildCourseCard(title: '', status: '',)
        ],
      ),
    );
  }
}

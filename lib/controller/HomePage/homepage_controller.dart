import 'package:get/get.dart';

class HomeController extends GetxController {
  List enrolledCourses = [];
  List savedCourses = [];
  List recommendations = [];
  double progress = 0.0;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void fetchHomeData() async {
    // هنا تفترض أنك جلبت البيانات من API باستخدام GetConnect أو http

    // محاكاة بيانات تجريبية:
    enrolledCourses = [
      {'title': 'Flutter Basics', 'progress': 0.6},
      {'title': 'Laravel Advanced', 'progress': 1.0}
    ];
    savedCourses = [
      {'title': 'UX/UI Design'}
    ];
    recommendations = [
      {'title': 'Dart Deep Dive'},
      {'title': 'Database Design'}
    ];
    progress = 0.6;

    update();
  }
}

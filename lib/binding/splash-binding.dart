import 'package:get/get.dart';
import 'package:second/controller/splash-controler.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}

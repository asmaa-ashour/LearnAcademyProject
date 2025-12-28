import 'package:get/get.dart';

import '../controller/ComplaintController.dart';


class ComplaintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplaintController());
  }
}

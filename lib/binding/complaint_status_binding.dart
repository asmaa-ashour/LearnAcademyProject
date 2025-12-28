import 'package:get/get.dart';
import '../controller/ComplaintStatusController.dart';


class ComplaintStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplaintStatusController());
  }
}

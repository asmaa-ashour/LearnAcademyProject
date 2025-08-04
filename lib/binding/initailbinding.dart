import 'package:get/get.dart';
import '../core/class/crud.dart';

/*
class InitialBindings extends Bindings {
  InitialBindings(
    Null Function() param0,
  );
  @override
  void dependencies() {
    Get.put(Crud());
  }
}*/
class InitialBindings extends Bindings {
  InitialBindings();
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:second/core/constant/routs.dart';


abstract class LoginController extends GetxController{
  login();
  goToSignUp();
}
class LoginControllerImp extends LoginController{
  late TextEditingController email;
  late TextEditingController password;
  @override
  login() {
    print("Loging in...");
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToSignUp() {
  Get.offNamed(AppRoute.signUp);
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

}
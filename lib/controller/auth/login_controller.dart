import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/class/cacheClass%20.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/data/datasource/remote/auth/login_data.dart';
import '../../core/constant/constant_data.dart';
import '../../core/function/handling_data.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  LoginData loginData = LoginData(Get.find());
  late TextEditingController email;
  late TextEditingController password;

  // late StatusRequest? statusRequest;
  StatusRequest statusRequest = StatusRequest.none;

  Map data = {};
  RxBool isPasswordHidden = true.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
    update(); // لأنك مستخدمة GetBuilder
  }

  @override
  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update(); // لإظهار مؤشر التحميل

      var response = await loginData.postData(
        email: email.text,
        password: password.text,
      );

      print("Response logic: $response");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        // هنا السيرفر رد بـ 200 OK
        if (response['status'] == "success" ||
            response['message'] == "Login successful") {
          String token = response['token'];
          await CacheClass.setData(key: "Token", value: token);
          await CacheClass.setData(key: "isLoggedIn", value: true);
          Get.offAllNamed(AppRoute.home);
        } else {
          // السيرفر رد بـ 200 لكن بيانات الدخول غلط (حسب تصميم الـ API)
          _showErrorDialog();
          statusRequest = StatusRequest.none;
        }
      } else {
        // هنا الحالة ليست success (ممكن 401 أو 500)
        // إذا كان الباك إند يرسل 401 عند خطأ الباسورد، الدايلوغ يجب أن يظهر هنا
        _showErrorDialog();
        statusRequest = StatusRequest.none;
      }
      update(); // لتحديث الواجهة وإخفاء التحميل
    }
  }

  void _showErrorDialog() {
    Get.defaultDialog(
      title: "خطأ في الدخول",
      middleText: "البريد الإلكتروني أو كلمة المرور غير صحيحة",
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.red),
      textConfirm: "حاول مجدداً",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () => Get.back(),
    );
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

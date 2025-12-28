import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email: email.text,
        password: password.text,
      );
      print(".............................controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        print(".................................... I now in controller");
        if (response['message'] == "Login successful") {
          Token = response['token'];
          Get.offNamed("/home");
          print(response['message']);
          print("$response ...................status");
          data.addAll((response['user']));
          print(data);
          Get.offNamed(AppRoute.home);
        } else {
          Get.snackbar("Warning", "Email Or Password Not Correct");
        }
      }
    } else {}
    update();
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

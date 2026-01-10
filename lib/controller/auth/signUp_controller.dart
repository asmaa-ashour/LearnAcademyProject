import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/routs.dart';
import '../../core/function/handling_data.dart';
import '../../data/datasource/remote/auth/sinup_data.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
// late String activationCode;
  late String emaile;
  //late int id;

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController full_name;
  late TextEditingController phone;

  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());

  //List data = [];
  RxBool isPasswordHidden = true.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
    update();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
        phone: phone.text,
        email: email.text,
        password: password.text,
        full_name: full_name.text,
      );
      print(".............................controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(" I now in controller");
        //Account created, please check your email for OTP.
        if (response['message'] ==
            "Account created, please check your email for OTP.") {
          print(response['message']);
          //بدا حذف اتوقع
          Get.snackbar("Done",
              "Your account has been created successfully please activate your account now");
          emaile = response["email"];
          Get.toNamed(AppRoute.verfiyCode, arguments: {
            "email": emaile,
          });

          ///////////////////////////////////////////////////////////////
          print(response['email']);
          print("$response ...................status");
        } else if (response['message'] ==
            "The email has already been taken. (and 1 more error)") {
          Get.snackbar("Warning", "The email has already been taken.");
          Get.toNamed(AppRoute.signUp);
        } else if (response['message'] == "The phone has already been taken.") {
          Get.snackbar("Warning", "The phone has already been taken.");
          Get.toNamed(AppRoute.signUp);
        }
      }
    } else {
      Get.toNamed(AppRoute.signUp);
    }
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.logIn);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    full_name = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    full_name.dispose();
    phone.dispose();
    super.dispose();
  }
}

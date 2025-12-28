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

          //  id=response['data']['id'];
          //////////////////////////////////////////////////////////////////
          // بعد نجاح التسجيل، احصل على القيم من response:
          // id = response["data"]["id"];
          emaile = response["email"];
          //   activationCode = response["otp"];

// ثم انتقل إلى صفحة التفعيل مع تمرير القيم:
//           Get.toNamed(AppRoute.verfiyCode, arguments: {
//             "email": email,
//           });

          Get.toNamed(AppRoute.verfiyCode, arguments: {
            "email": emaile,

            // "otp": activationCode, // من الريسبونس
          });

          ///////////////////////////////////////////////////////////////
          print(response['email']);
          print("$response ...................status");
          // data.addAll((response['data']));
          // Get.offNamed(AppRoute.verfiyCode);
        } else if (response['message'] ==
            "The email has already been taken. (and 1 more error)") {
          Get.snackbar("Warning", "The email has already been taken.");
          Get.toNamed(AppRoute.signUp);
        } else if (response['message'] == "The phone has already been taken.") {
          Get.snackbar("Warning", "The phone has already been taken.");
          Get.toNamed(AppRoute.signUp);
        }
        // else if (response['message'] ==
        //     "The password field format is invalid.") {
        //   Get.snackbar("Warning", "The password field format is invalid.");
        // }
      }
    } else {}
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

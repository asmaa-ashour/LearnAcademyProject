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
 late String activationCode;
 late String emailFromResponse;
 late int id;

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController full_name;
  late TextEditingController age;
  late TextEditingController gender;

  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());

  //List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          username: username.text,
          email: email.text,
          password: password.text,
          age: age.text,
          full_name: full_name.text,
          gender: gender.text);
      print(".............................controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(" I now in controller");
        if (response['success'] == true) {
          print(response['success']);
          Get.snackbar("Done", "Your account has been created successfully please activate your account now");

        //  id=response['data']['id'];
          //////////////////////////////////////////////////////////////////
          // بعد نجاح التسجيل، احصل على القيم من response:
           id = response["data"]["id"];
          emailFromResponse = response["data"]["email"];
           activationCode = response["data"]["activation_code"];


// ثم انتقل إلى صفحة التفعيل مع تمرير القيم:
          Get.toNamed(AppRoute.verfiyCode, arguments: {
            "id": id,
            "email": emailFromResponse,
            "activation_code": activationCode
          });
          ///////////////////////////////////////////////////////////////
          print(response['data']['id']);
          print("$response ...................status");
          // data.addAll((response['data']));
          Get.offNamed(AppRoute.verfiyCode);
        } else if (response['message'] == "your email does not exist :(") {
          Get.snackbar("Warning", "The email has already been taken.");
        } else if (response['message'] ==
            "The username has already been taken.") {
          Get.snackbar("Warning", "The username has already been taken.");
        } else if (response['message'] ==
            "The password field format is invalid.") {
          Get.snackbar("Warning", "The password field format is invalid.");
        }
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
    username = TextEditingController();
    full_name = TextEditingController();
    gender = TextEditingController();
    age = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    full_name.dispose();
    age.dispose();
    gender.dispose();
    super.dispose();
  }
}

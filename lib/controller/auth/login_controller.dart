import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/data/datasource/remote/auth/login_data.dart';
import '../../core/function/handling_data.dart';


abstract class LoginController extends GetxController{
  login();
  goToSignUp();
}
class LoginControllerImp extends LoginController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  LoginData loginData = LoginData(Get.find());
  late TextEditingController username;
  late TextEditingController password;


  // late StatusRequest? statusRequest;
  StatusRequest statusRequest = StatusRequest.none;

  List data = [];
  @override
  login() async{
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          username: username.text,
          password: password.text,
      );
      print(".............................controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        print(" I now in controller");
        if (response['success'] == true) {
          Get.offNamed("/home");
          print(response['success']);
          print("$response ...................status");
          data.addAll((response['data']));
          print(data);
          Get.offNamed("/home");
        } else {
          Get.snackbar("Warning", "Username Or Password Not Correct");
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
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }


}
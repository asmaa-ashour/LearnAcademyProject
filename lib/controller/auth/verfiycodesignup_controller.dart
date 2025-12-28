
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/routs.dart';
import '../../core/function/handling_data.dart';
import '../../data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  // checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());


  late String email;
//  late String emailFromResponse;
 late String activationCode;

  StatusRequest statusRequest = StatusRequest.none ;

  @override
  void onInit() {
    // id = Get.arguments['id'];
    email = Get.arguments['email'];
    print("Email received = $email");
    //activationCode = Get.arguments['otp'];
    super.onInit();
  }
  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(email, verfiyCodeSignUp
    );
    print(email);
    print(verfiyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == "Account verified successfully") {
        print("Verification response: $response");
        print("${response['message']}");
        print(".....................................?");
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "Verify Code Not Correct Please Enter Correct Code");
        // Get.offNamed(AppRoute.verfiyCode);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  // reSend(){
  //   print("Resending code for email=$email, activationCode=$activationCode");
  //   verfiyCodeSignUpData.resendData(email,activationCode);
  //   Get.snackbar("note", "we again sent your activation code  succesfully");
  //
  // }
  //
  // @override
  // checkCode() {
  //
  // }

}

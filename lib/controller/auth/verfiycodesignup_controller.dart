
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/routs.dart';
import '../../core/function/handling_data.dart';
import '../../data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());


  late int id;
  late String emailFromResponse;
  late String activationCode;

  StatusRequest statusRequest = StatusRequest.none ;

  @override
  void onInit() {
    id = Get.arguments['id'];
    emailFromResponse = Get.arguments['email'];
    activationCode = Get.arguments['activation_code'];
    super.onInit();
  }
  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(id, verfiyCodeSignUp
    );
    print(id);
    print(activationCode);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  reSend(){
    print("Resending code for id=$id, email=$emailFromResponse");
    verfiyCodeSignUpData.resendData(id,emailFromResponse);
  }

  @override
  checkCode() {

  }

}

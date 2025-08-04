import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/imageassets.dart';
import '../../core/function/validinput.dart';
import '../widget/auth/CustomArrow.dart';
import '../widget/auth/CustomBackgroundPainter.dart';
import '../widget/auth/CustomeButtonAuth.dart';
import '../widget/auth/_buildTextField.dart';
import '../widget/auth/image_signup_login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? const Center(
                    child: Text("Loading..."),
                  )
                : Stack(
                    children: [
                      const CustomeImageAuth(
                        images: ImageAsset.logInThreeImage,
                      ),
                      Positioned(
                        bottom: 0,
                        child: CustomPaint(
                          size: Size(MediaQuery.of(context).size.width, 250),
                          painter: CustomBackgroundPainter(),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Form(
                              key: controller.formstate,
                              child: Column(
                                children: [
                                  CustomArrow(
                                    isSignUpPage: false,
                                    onTap: () {
                                      controller.goToSignUp();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  buildTextField(
                                    hint: "Email Address",
                                    valid: (val) {
                                      return validInput(val!, 4, 50, " login");
                                    },
                                    myController: controller.username,
                                  ),
                                  const SizedBox(height: 15),
                                  buildTextField(
                                    hint: "Password",
                                    valid: (val) {
                                      return validInput(val!, 6, 50, " login");
                                    },
                                    myController: controller.password,
                                  ),
                                  const SizedBox(height: 25),
                                  CustomButtonAuth(
                                      text: "Log In",
                                      onPressed: controller.login),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

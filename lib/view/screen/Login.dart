import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/constant/imageassets.dart';
import '../widget/auth/CustomArrow.dart';
import '../widget/auth/CustomBackgroundPainter.dart';
import '../widget/auth/CustomeButtonAuth.dart';
import '../widget/auth/_buildTextField.dart';
import '../widget/auth/image_signup_login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: Stack(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                      valid: (val) {},
                      myController: controller.email,
                    ),
                    const SizedBox(height: 15),
                    buildTextField(
                      hint: "Password",
                      valid: (val) {},
                      myController: controller.password,
                    ),
                    const SizedBox(height: 25),
                    CustomButtonAuth(
                        text: "Log In", onPressed: controller.login),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

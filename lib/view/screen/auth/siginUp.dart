import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/function/validinput.dart';
import 'package:second/view/widget/auth/CustomeButtonAuth.dart';
import '../../../controller/auth/signUp_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/imageassets.dart';
import '../../widget/auth/CustomArrow.dart';
import '../../widget/auth/CustomBackgroundPainter.dart';
import '../../widget/auth/_buildTextField.dart';
import '../../widget/auth/image_signup_login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put( SignUpControllerImp());
    // Get.lazyput(() => SignUpControllerImp());

    return Scaffold(
      body: Stack(
        children: [
          const CustomeImageAuth(images: ImageAsset.signUpfirstImage),
          Positioned(
            bottom: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 250),
              painter: CustomBackgroundPainter(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: GetBuilder<SignUpControllerImp>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          CustomArrow(
                            isSignUpPage: true,
                            onTap: () {
                              controller.goToSignIn();
                            },
                          ),
                          const SizedBox(height: 20),
                          buildTextField(
                            valid: (val) {return validInput(val!, 4, 50, "fullname");},
                            hint: "Full Name",
                            myController: controller.full_name,
                          ),
                          const SizedBox(height: 15),
                          buildTextField(
                            valid: (val) {return validInput(val!, 11, 50,"email");},
                            hint: "Email",
                            myController: controller.email,
                          ),
                          const SizedBox(height: 15),
                          buildTextField(
                            valid: (val) {return validInput(val!, 6, 50," password");},
                            hint: "Password",
                            myController: controller.password,
                          ),
                          const SizedBox(height: 25),
                          buildTextField(
                            valid: (val) {return validInput(val!,4, 50, "username");},
                            hint: "User Name",
                            myController: controller.username,
                          ),
                          const SizedBox(height: 25),
                          buildTextField(
                            valid: (val) {return validInput(val!,2,4,"age");},
                            hint: "age",
                            myController: controller.age,
                          ),
                          const SizedBox(height: 25),
                          buildTextField(
                            valid: (val) {return validInput(val!,0,1,"gender");},
                            hint: "gender",
                            myController: controller.gender,
                          ),
                          const SizedBox(height: 25),
                          CustomButtonAuth(
                              text: "Sign Up",
                              onPressed: () {
                                controller.signUp();
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

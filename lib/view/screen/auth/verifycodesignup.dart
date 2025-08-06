import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verfiycodesignup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
/*
class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.secondColor,
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme
                .of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) =>
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      const CustomTextTitleAuth(text: "Check code"),
                      const SizedBox(height: 10),
                      const CustomTextBodyAuth(text: "Please Enter The Digit Code Sent To you "),
                      const SizedBox(height: 15),
                      OtpTextField(
                        fieldWidth: 50.0,
                        borderRadius: BorderRadius.circular(20),
                        numberOfFields: 6,
                        borderColor: const Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))],

                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goToSuccessSignUp(verificationCode);
                        }, // end onSubmit
                      ),
                      const SizedBox(height: 40),
                      InkWell(onTap: () {
                        controller.reSend();
                      },
                        child: const Center(child: Text("Resend verfiy code",
                          style: TextStyle(
                              color: AppColor.secondColor, fontSize: 20),)),)
                    ]),
                  ))),
    );
  }
}*/

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);
//asssoome  dXQBzx

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.secondColor,
        elevation: 0.0,
        title: Text(
          'Verification Code',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                 const Icon(
                    Icons.mark_email_read_rounded,
                    color: AppColor.secondColor,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(text: "Check your inbox"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                    text: "Please enter the 6-digit code sent to your email",
                  ),
                  const SizedBox(height: 30),

                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 15),
                      child: OtpTextField(
                        numberOfFields: 6,
                        borderRadius: BorderRadius.circular(15),
                        fieldWidth: 40.0,
                        borderColor: AppColor.secondColor,
                        showFieldAsBox: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
                        ],
                        onCodeChanged: (String code) {
                          // Optional: validation logic
                        },
                        onSubmit: (String verificationCode) {
                          controller.goToSuccessSignUp(verificationCode);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  GestureDetector(
                    onTap: () => controller.reSend(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.secondColor.withOpacity(0.9),
                      ),
                      child: const Text(
                        "Resend verification code",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

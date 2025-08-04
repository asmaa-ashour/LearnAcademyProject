import 'package:get/get.dart';
import 'package:second/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';

String lang = '';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text("1".tr),
          const SizedBox(height: 20),
          CustomButtonLang(
            textbutton: "2".tr,
            onPressed: () {Get.offNamed("/onboarding");},
          ),
          CustomButtonLang(
            textbutton: "3".tr,
            onPressed: () {Get.offNamed("/onboarding");},
          )
        ],
      ),
    ));
  }
}

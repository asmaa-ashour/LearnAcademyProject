
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successsignup_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/CustomeButtonAuth.dart';
/*
class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
    Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.secondColor,
        elevation: 0.0,
        title: Text( "Success",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.secondColor,
              )),
          Text("congratulations",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30)),
          Text("successfully registered"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text:"Go To Login",
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
*/

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.secondColor,
        elevation: 0.0,
        title: Text(
          "Success",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 30),

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.celebration,
                          size: 120,
                          color: AppColor.secondColor,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Congratulations!",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 28, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "You have successfully registered",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                SizedBox(
                  width: double.infinity,
                  child: CustomButtonAuth(
                    text: "Go To Login",
                    onPressed: () {
                      controller.goToPageLogin();
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

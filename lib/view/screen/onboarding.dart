import 'package:second/controller/onboarding_controller.dart';
import 'package:second/view/widget/onboarding/customslide.dart';
import 'package:second/view/widget/onboarding/custumbutton.dart';
import 'package:second/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      Expanded(flex: 5, child: CustomSlideOnBoarding()),
                      //   SizedBox(height: 20),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            CustomDotControllerOnBoarding(),
                            Spacer(
                              flex: 1,
                            ),
                            CustombuttonOnBoarding(),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /* const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 5, child: CustomSlideOnBoarding()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotControllerOnBoarding(),
                      Spacer(
                        flex: 1,
                      ),
                      CustombuttonOnBoarding(),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }*/
    /*
  return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) => {controller.onPageChanged(value)},
      itemCount: OnBoardingModelList.length,
      itemBuilder: (context, i) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("${OnBoardingModelList[i].image}"))),
            ),
            Positioned(
                top: 80,
                bottom: 350,
                left: 40,
                right: 40,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(OnBoardingModelList[i].textOne,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 30),
                      Text(
                        OnBoardingModelList[i].TextTwo,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      CustomBottom(
                        text: 'Next',
                      )
                    ])))
          ],
        );
  */
  }
}

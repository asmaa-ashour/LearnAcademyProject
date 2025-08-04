import 'package:get/get.dart';
import 'package:second/controller/onboarding_controller.dart';
import 'package:second/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class CustomSlideOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSlideOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: UpDownEdgeClipper(),
                  child: Image.asset(
                    onBoardingList[i].image!,
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              onBoardingList[i].body!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
 const Text('أهلاً بك!',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      const SizedBox(height: 16),
                      const Text(
                        'ابدأ رحلتك التعليمية بأسلوب تفاعلي وممتع، واكتشف ميزات رائعة بانتظارك!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
*/

class UpDownEdgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 40); // نقطة البداية (يمين الحافة العليا مع انحناء لأعلى)
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 40);

    // حافة منحنية للأسفل على اليمين
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width * 0.5,
      size.height,
    );

    // حافة منحنية للأعلى على اليسار
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      0,
      size.height - 40,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

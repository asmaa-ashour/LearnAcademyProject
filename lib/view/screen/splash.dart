import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/splash-controler.dart';

import '../../core/constant/imageassets.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController()); // ✅ بدون binding
    return Scaffold(
      backgroundColor: const Color(0xFF6614e1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAsset.logo, width: 150, height: 200),
            const SizedBox(height: 20),
            const Text(
              'LEARNING STUDENT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
 const Color(0xFFC022FF),
      // const Color(0xFF29FF22),
      // const Color(0xFF7B4F32),

       'assets/images/3.png',

       v 'LEARNING STUDENT',
       */
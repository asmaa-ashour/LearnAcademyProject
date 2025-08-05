import 'package:flutter/cupertino.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/view/screen/auth/Login.dart';
import 'package:second/view/screen/auth/verifycodesignup.dart';
import 'package:second/view/screen/home_page.dart';
import 'package:second/view/screen/language.dart';
import 'package:second/view/screen/onboarding.dart';
import 'package:second/view/screen/auth/siginUp.dart';
import 'package:second/view/screen/splash.dart';
class AppPages {
  static const initial = '/logIn';

  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.lang: (context) => const Language(),
    AppRoute.logo: (context) => const SplashView(),
    AppRoute.onBoarding: (context) => const OnBoarding(),
    AppRoute.logIn: (context) => const Login(),
    AppRoute.signUp: (context) => const SignUp(),
    AppRoute.verfiyCode: (context) => const VerfiyCodeSignUp(),
    AppRoute.home: (context) => const HomePage(),
  };
}

/*
  static final routes = [
    GetPage(
      name: '/splash',
      page: () {
        Get.put(SplashController());
        return const SplashView();
      },
    ),
    GetPage(
        name: '/onboarding',
        page: () {
          Get.put(OnBoardingControllerImp());
          return const OnBoarding();
        }),
    // GetPage(
    //   name: '/login',
    //   page: () => const LoginView(),
    //   binding: LoginBinding(),
    // ),
  ];

 */
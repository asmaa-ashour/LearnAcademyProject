import 'package:flutter/cupertino.dart';
import 'package:second/core/constant/routs.dart';
import 'package:second/view/screen/auth/Login.dart';
import 'package:second/view/screen/auth/success_signup.dart';
import 'package:second/view/screen/auth/verifycodesignup.dart';
import 'package:second/view/screen/course.dart';
import 'package:second/view/screen/home_page.dart';
import 'package:second/view/screen/home_page/homepage.dart';
import 'package:second/view/screen/language.dart';
import 'package:second/view/screen/logout.dart';
import 'package:second/view/screen/onboarding.dart';
import 'package:second/view/screen/auth/siginUp.dart';
import 'package:second/view/screen/oursedetailspage.dart';
import 'package:second/view/screen/personal_profile/personal_profile.dart';
import 'package:second/view/screen/recommendationScreen.dart';
import 'package:second/view/screen/splash.dart';
class AppPages {
  static const initial = '/homePage';

  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.lang: (context) => const Language(),
    AppRoute.logo: (context) => const SplashView(),
    AppRoute.onBoarding: (context) => const OnBoarding(),
    AppRoute.logIn: (context) => const Login(),
    AppRoute.logOut: (context) => const LogOut(),
    AppRoute.signUp: (context) => const SignUp(),
    AppRoute.verfiyCode: (context) => const VerfiyCodeSignUp(),
    AppRoute.successSignUp: (context) => const SuccessSignUp(),
    AppRoute.homePage: (context) =>  HomePage(),
    //AppRoute.home: (context) =>  HomeScreen(),
    AppRoute.courseDetails: (context) => const CourseDetailsPage(),//مو زابطة
    AppRoute.recommendationScreen: (context) => RecommendationScreen(),
    AppRoute.profileScreen: (context) => ProfileViewScreen(),

  };
}
//
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
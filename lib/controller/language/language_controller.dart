import 'dart:ui';
import 'package:get/get.dart';

import '../../core/services/services.dart';

class LanguageController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLanguage(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lnag", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? shardPrefLang = myServices.sharedPreferences.getString("lang");
    if (shardPrefLang == "ar") {
      language = const Locale("ar");
    } else if (shardPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}

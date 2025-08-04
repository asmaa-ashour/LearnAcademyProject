import 'package:get/get.dart';

class Translation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "اختر اللغة",
          "2":"اللغة الانكليزية",
          "3":"اللغة العربية ",
        },
        "en": {
          "1": "Choose Langauge",
          "2": "English",
          "3": "Arabic",
        }
      };
}

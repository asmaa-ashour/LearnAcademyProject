import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/route.dart';
import 'binding/initailbinding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      initialBinding: InitialBindings(),
        translations: Translation(),
      debugShowCheckedModeBanner: false,
     locale:controller.language,
      theme: ThemeData(
        textTheme: const TextTheme(
            headlineMedium:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.initial,
      routes: AppPages.routes,
    );
  }
}

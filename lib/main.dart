import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:second/core/class/cacheClass%20.dart';
import 'package:second/route.dart';
import 'binding/initailbinding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // ممكن تسجل معلومات أو تحدث كاش، بس عادة العرض يتم تلقائيًا بالخلفية
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
//Future<void>
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 1️⃣ تهيئة Firebase
  await Firebase.initializeApp();
  await CacheClass.cacheIniti();

  // 2️⃣ باقي الخدمات الخاصة بتطبيقك
  await initialServices();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // طلب إذن (iOS/Android 13+)
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // قناة إشعارات للأندرويد (ضرورية لأندرويد 8+)
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'app_notifications_channel', // ثابت
    'App Notifications',
    description: 'General app notifications',
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

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
      locale: controller.language,
      theme: controller.appTheme,
      // theme: ThemeData(
      //   textTheme: const TextTheme(
      //       headlineMedium:
      //           TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //   primarySwatch: Colors.blue,
      // ),
      initialRoute: AppPages.initial,
      routes: AppPages.routes,
    );
  }
}

Future<void> showForegroundNotification({
  required String? title,
  required String? body,
}) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'app_notifications_channel',
    'App Notifications',
    channelDescription: 'General app notifications',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
  );

  const NotificationDetails platformDetails =
      NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title ?? '',
    body ?? '',
    platformDetails,
  );
}

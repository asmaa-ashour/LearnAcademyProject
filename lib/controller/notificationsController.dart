import 'dart:convert';
import 'package:get/get.dart';
// import 'package:project2/core/class/cacheclass.dart';
// import 'package:project2/core/class/statusRequest.dart';
// import 'package:project2/core/functions/handlingData.dart';
// import 'package:project2/data/datasource/remote/home/notificationsData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:second/core/class/cacheClass%20.dart';
// import 'package:project2/main.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/function/handling_data.dart';
import 'package:second/data/datasource/remote/notificationsdata%20.dart';
import 'package:second/main.dart';

class NotificationsControllerImp extends GetxController {
  Notificationsdata notificationsdata = Notificationsdata(Get.find());

  List data = [];
  StatusRequest? statusRequest;

  Future<void> shownotifications() async {
    var response = await notificationsdata.getDataNotifications();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        data.clear();
        data.addAll(response['data']);
        update();
      }
    }

    CacheClass.setData(key: "notifications", value: jsonEncode(data));
  }

  @override
  void onInit() {
    // حمّل من الكاش أولاً
    String? saved = CacheClass.getData(key: "notifications");
    if (saved != null) {
      data = jsonDecode(saved);
      statusRequest = StatusRequest.success;
    }

    // جلب من السيرفر
    shownotifications();

    // استمع لرسائل foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final title = message.notification?.title ?? message.data['title'];
      final body = message.notification?.body ?? message.data['body'];

      // 1) اعرض إشعار فوق كنظام
      // await showForegroundNotification(title: title, body: body);

      // 2) ضيفه للقائمة فورًا
      final notif = {
        "id": message.messageId ?? DateTime.now().toString(),
        "data": {"title": title ?? "", "body": body ?? ""},
        "created_at": DateTime.now().toIso8601String(),
      };

      // فلترة تكرار حسب id
      final exists = data.any((n) => n['id'] == notif['id']);
      if (!exists) {
        data.insert(0, notif);
        update();
        CacheClass.setData(key: "notifications", value: jsonEncode(data));
      }
    });

    super.onInit();
  }
}

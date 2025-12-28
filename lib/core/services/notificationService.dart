import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'dart:io';

class NotificationService extends GetxService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<NotificationService> init() async {
    await _requestPermission();
    await _getToken();
    _listenForeground();

    return this;
  }

  /// طلب صلاحيات الإشعارات
  Future<void> _requestPermission() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  /// جلب FCM Token
  Future<void> _getToken() async {
    String? token = await _firebaseMessaging.getToken();
    print('🔥 FCM Token: $token');
  }

  /// الاستماع للإشعارات والتطبيق مفتوح
  void _listenForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📩 Notification Received');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
    });
  }
}

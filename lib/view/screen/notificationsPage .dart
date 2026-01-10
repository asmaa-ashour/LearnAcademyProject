import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:project2/controller/notifications/notifications_controller.dart';
// import 'package:project2/core/class/statusRequest.dart';
import 'package:intl/intl.dart';
// import 'package:project2/core/constant/AppColors.dart';
import 'package:second/controller/notificationsController.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/color.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإشعارات"),
        centerTitle: true,
        backgroundColor: AppColor.prrimaryColor,
      ),
      body: GetBuilder<NotificationsControllerImp>(
        init: NotificationsControllerImp(),
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.data.isEmpty) {
            return const Center(
              child: Text(
                "لا يوجد إشعارات",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              var notif = controller.data[index];

              // تنسيق التاريخ
              String createdAt = notif['created_at'] ?? "";
              String formattedDate = "";
              if (createdAt.isNotEmpty) {
                try {
                  DateTime dt = DateTime.parse(createdAt);
                  formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(dt);
                } catch (e) {
                  formattedDate = createdAt;
                }
              }

              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.notifications, color: Colors.blue),
                  title: Text(
                    notif['data']?['title'] ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    notif['data']?['body'] ?? "",
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

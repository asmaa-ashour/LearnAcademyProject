import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/logout_controller.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    LogOutControllerImp controller = Get.put(LogOutControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:const Text("Logout"),
      ),
      body: Center(
        child: Container(color: Colors.amber,
          child: InkWell(
            child:const Text("LogOut"),
            onTap: () {

              controller.logout();
            },
          ),
        ),
      ),
    );
  }
}

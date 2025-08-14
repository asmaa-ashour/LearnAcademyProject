import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/data/datasource/remote/auth/logout_data.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/constant_data.dart';
import '../../core/constant/routs.dart';
import '../../core/function/handling_data.dart';

abstract class LogOutController extends GetxController {
  logout();
}

class LogOutControllerImp extends LogOutController {

  StatusRequest statusRequest = StatusRequest.none;
  LogoutData logoutData = LogoutData(Get.find());
  @override
  logout() async {
    Get.defaultDialog(
        title: "Aleart",
        middleText: "Are you sure you need log out??",
        actions: [
          ElevatedButton(
              onPressed: () async {
                statusRequest = StatusRequest.loading;
                var response = await logoutData.postData(
                  token:'$Token',
                );
                print("$Token");
                statusRequest = handlingData(response);
                if (StatusRequest.success == statusRequest) {
                if (response['success'] == true) {
                  Get.snackbar("Aleart", "your are logged-out successfully");
                  Get.offNamed(AppRoute.logIn);
                } else {
                  Get.snackbar("Warning", "Unauthenticated");
                }
                }
                update();
              },
              child:const Text("Yes")),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child:const Text("No"))
        ]);
  }
}
/*



logout()async {
    dynamic data = await Api().delet(
      url: "http://192.168.1.109:8050/api/auth/register",
      body:{},
      token: {"$Token"},
    );
  }
  في حال كان لدي هذا التابع لعمل تسجيل خروج للمستخدم و لدي توكين المستخدم محفوظ في المتفير
  Token
  كيف اقوم بارساله بالتابع؟؟؟؟ اعطني الكود من فضلك

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      @required dynamic token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': '$token'});
    }
    http.Response response = await http.post(Uri.parse(url), body: body,headers: header);

    if (response.statusCode == 201||response.statusCode==200) {
     dynamic data = jsonDecode(response.body);

      return data;
    } else {
      print(".....${response.statusCode}");
    }
  }
وهل هذا الكود صحيح؟؟؟؟؟؟؟؟؟؟؟


*/


/*

في حال كان هذا الريسبونس العائد عندنجاح تسجيل خروج من الحساب
{
    "message": "Successfully logged out"
}
و هذا الريسبونس في حال الفشل
{
    "message": "Unauthenticated."
}
اريد تابع يقوم بعمل تسجيل الخروج علما ان التوكين محفظ في متغبر يدعى
  Toke
  و هذا تابع البوست قم بالتعديلات المناسبة اذا اردت ليتناسب مع المتطلب

حال كان هذا الريسبونس العائد عندنجاح تسجيل خروج من الحساب
{
    "message": "Successfully logged out"
}
و هذا الريسبونس في حال الفشل
{
    "message": "Unauthenticated."
}
اريد تابع يقوم بعمل تسجيل الخروج علما ان التوكين محفظ في متغبر يدعى
  Toke
  و هذا تابع البوست قم بالتعديلات المناسبة اذا اردت ليتناسب مع المتطلب

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      @required dynamic token}) async {
    dynamic header = {};
    if (token != null) {
      header.addAll({'Authorization': token});
    }
    http.Response response = await http.post(Uri.parse(url), body: body,headers: header);

    if (response.statusCode == 201||response.statusCode==200) {
     dynamic data = jsonDecode(response.body);

      return data;
    } else {
      print(".....${response.statusCode}");
    }
  }

 */
/*

ان هذا هو تابع البوست

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      @required dynamic token}) async {
    dynamic header = {};
    if (token != null) {
      header.addAll({'Authorization': token});
    }
    http.Response response = await http.post(Uri.parse(url), body: body,headers: header);
    //و في هذا السطر يقوم بالقاء اكسبشن من النوع         Exception has occurred.
_TypeError (type '_Map<dynamic, dynamic>' is not a subtype of type 'Map<String, String>?')


    if (response.statusCode == 201||response.statusCode==200) {
     dynamic data = jsonDecode(response.body);

      return data;
    } else {
      print(".....${response.statusCode}");
    }
  }
حيث ان
String Token="";
و هذا هو تابع تسجيل الخروج

 logout() async {
    dynamic data = await Api().post(
        url: "http://192.168.1.109:8050/api/auth/logout",
        body: {},
        token: Token);
    if (data['message'] == 'Successfully logged out') {
      Get.offNamed(AppRoute.logIn);
    } else {
      print("Unauthenticated.");
    }
    update();
  }
  قم بتصحيح هذا الخطأ الاكسبشن الذي يحدث من فضلك





 */
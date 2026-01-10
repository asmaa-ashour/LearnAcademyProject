import 'package:second/core/class/cacheClass%20.dart';
import 'package:second/core/class/crud.dart';
import 'package:second/core/constant/constant_data.dart';
import 'package:second/link_app.dart';

class Notificationsdata {
  Crud crud;
  Notificationsdata(this.crud);
  getDataNotifications() async {
    var response = await crud.getRequest(
        AppLink.notifications, CacheClass.getData(key: "Token") as Map, "");
    print("$response");
    return response.fold((l) => l, (r) => r);
  }
}

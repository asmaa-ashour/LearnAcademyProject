import 'package:second/link_app.dart';
import '../../../../core/class/crud.dart';

class LogoutData {
  Crud crud;
  LogoutData(this.crud);
  postData({
    required dynamic token,
  }) async {
    var response = await crud.postData(
      AppLink.login,
      {},
      {token},
    );
    return response.fold((l) => l, (r) => r);
  }

}

import 'package:second/link_app.dart';
import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData({
    required String username,
    required String password,
  }) async {
    var response = await crud.postData(
      AppLink.login,
      {
        "username": username,
        "password": password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

}

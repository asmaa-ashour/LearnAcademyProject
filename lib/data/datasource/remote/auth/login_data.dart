import 'package:second/link_app.dart';
import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData({
    required String email,
    required String password,
  }) async {
    var response = await crud.postData(
      AppLink.login,
      {
        "email": email,
        "password": password,
      },{},
    );
    return response.fold((l) => l, (r) => r);
  }

}

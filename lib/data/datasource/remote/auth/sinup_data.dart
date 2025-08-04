import 'package:second/link_app.dart';
import '../../../../core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData({
    required String username,
    required String email,
    required String password,
    required String age,
    required String full_name,
    required String gender,
  }) async {
    var response = await crud.postData(
      AppLink.signUp,
       {
        "username": username,
        "email": email,
        "password": password,
        "age": age,
        "full_name": full_name,
        "gender": gender,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

}

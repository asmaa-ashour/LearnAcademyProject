import 'package:second/link_app.dart';
import '../../../../core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData( {
    required String email,
    required String password,
    required String full_name,
    required String phone,
  }) async {
    var response = await crud.postData(
      AppLink.signUp,
       {
        "phone": phone,
        "email": email,
        "password": password,
        "name": full_name,
      },{},
    );
    return response.fold((l) => l, (r) => r);
  }

}

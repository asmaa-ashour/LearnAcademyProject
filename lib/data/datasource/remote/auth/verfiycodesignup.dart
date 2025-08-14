import '../../../../core/class/crud.dart';
import '../../../../link_app.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(int id, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifycodessignup, {"id": id.toString(), "activation_code": verifycode},{},);
    return response.fold((l) => l, (r) => r);
  }

  resendData(int id ,String email) async {
    var response = await crud.postData(AppLink.resend, { "id": id.toString(),"email": email},{},);
    return response.fold((l) => l, (r) => r);
  }
}

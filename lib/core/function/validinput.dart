import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (val.isEmpty) {
      return "can't be Empty";}
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "email not correct";
    }}

if(type=="password"){
 if (val.length < 6) {
    return 'password must be at least 6 character';
  } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])').hasMatch(val)) {
    return 'must be content large character,symbol,number,';
  }
}

  if (type == "gender") {
    {
      if (val.isEmpty) {
        return "not valid gender";
      }
      else if (val != '0' && val != '1') {
        return 'gender must be 0 to female and 1 to male';
      }
    }
  }

  if (type == "age") {
    if (val.isEmpty) {
      return "can't be Empty";}
      int? age = int.tryParse(val);
      if (age == null || age < 16 || age > 100) {
        return 'age must be between 16 and 100';
      }else if(val.isEmpty) {
        return "not valid age";
      }
  }
  if (type =="fullname"){
    if (val.isEmpty) {
      return 'not valid full name';
    }
  }

    if (val.isEmpty) {
      return "can't be Empty";
    }
  if (type =="login"){
    if (val.isEmpty) {
      return 'not valid full name';
    }
    else{
      return 'Not Correct';
    }
  }

    if (val.length < min) {
      return "can't be less than $min";
    }
    if (val.length > max) {
      return "can't be larger than $max";
    }

}
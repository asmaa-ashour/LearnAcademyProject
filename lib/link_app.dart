class AppLink {
  static const String serverLink = "http://192.168.52.35:8000/api";

  // =============================Auth=====================//
  static const String signUp = "$serverLink/register";
  static const String login = "$serverLink/login";
  static const String logout = "$serverLink/logout";
  static const String resend = "$serverLink/resend";
  static const String verifycodessignup = "$serverLink/verifyOtp";

  //===================== images ===========================back
  static const String imagestatic = "http://192.168.137.167:8050";

  static const String imagecategories = "$imagestatic/images/category/";

  static const String imageitemes = "$imagestatic/images/category";
}

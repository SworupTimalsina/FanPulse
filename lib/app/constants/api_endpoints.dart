class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeOut = Duration(seconds: 1000);
  static const Duration receiveTimeOut = Duration(seconds: 1000);
  // for android
  static const String baseUrl = "http://10.0.2.2:3000/api/v1/";
  // // for iphone
  // static const String baseUrl = "http://localhost:3000/api/v1/";
  // ======== Auth ===============
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "auth/uploadImage/";
  static const String getUser = "auth/";
  static const String updateUser = "auth/update/";


  // ======== Articles ===============
  static const String createArticle = "article/add";
  static const String updateArticle = "article/";
  static const String deleteArticle = "article/";
  static const String getAllArticles = "article";
}

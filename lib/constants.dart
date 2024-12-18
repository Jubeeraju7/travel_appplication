class Constants {
  static String? token;
  static const String defaultLoginToken = "your_default_token_here";
  static Map<String, String> getApiHeader({bool useDefaultToken = false}) {
    return {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Methods": "GET,PUT,PATCH,POST,DELETE",
      "Content-Type": "application/json",
      "Authorization": useDefaultToken
          ? "Bearer $defaultLoginToken"
          : (token != null ? "Bearer $token" : ""),
    };
  }

  static const int Http_timeout = 15;
}

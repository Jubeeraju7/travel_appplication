import 'package:get/get_connect/connect.dart';
import 'constants.dart'; 

class LoginProvider extends GetConnect {
  Future<Map<String, dynamic>> login({required Map<String, dynamic> jsondata}) async {
    print(jsondata);
    httpClient.timeout = Duration(seconds: Constants.Http_timeout);

    try {
      // Use default token for login request
      var response = await post(
        'http://claim.exacore.co.in/api/auth/login',
        jsondata,
        headers: Constants.getApiHeader(useDefaultToken: true),
      );

      if (response.statusCode == 200) {
        final data = response.body;
        Constants.token = data['token']; 
        return {"code": response.statusCode, "message": data};
      } else {
        return {"code": response.statusCode, "message": "Authentication failed"};
      }
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }
  }
}

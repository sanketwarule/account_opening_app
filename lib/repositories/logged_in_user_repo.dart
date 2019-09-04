import 'package:account_opening_app/models/models.dart';
import 'package:account_opening_app/network/network_handler.dart';
import 'package:account_opening_app/utils/app_constants.dart';
import 'package:account_opening_app/utils/device_utils.dart';

class LoggedInUserRepository {
  NetworkHandler _helper = NetworkHandler();

  Future<User> signIn(String username, String password) async {
        String imei = await imeiCode();
    String deviceUsed = await deviceType();
    String appVersion = await appVersionName();
    print("imei : $imei , deviceUsed : $deviceUsed , appVersion : $appVersionName");


String data = "NTId="+username.toString().trim()
              +"&NTPass="+password.toString().trim()
              +"&IMEI="+imei
              + "&version="+appVersion.substring(0,3) // making 8.1.0 to 8.1
              +"&flag=L"
              +"&device="+deviceUsed
              +"&token="; 

    // final response = await _helper.post(LOGIN_URL, data);
    final response = await _helper.get("");
    return User(response);
}
}
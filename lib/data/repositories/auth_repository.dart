import 'package:account_opening_app/data/web_client/web_client.dart';
import 'package:account_opening_app/models/models.dart';
import 'package:account_opening_app/utils/app_constants.dart';
import 'package:account_opening_app/utils/utils.dart';

class AuthRepository{
  const AuthRepository({
    this.webClient = const WebClient(),
  });
  final WebClient webClient;

  Future<LoginResponse> sendRequest(
      {String url, dynamic data}) async {
    url += BASE_URL + url;

    final dynamic response = await webClient.post(url, data);

//    final LoginResponse loginResponse = response;

//    if (loginResponse.error != null) {
//      throw loginResponse.error.message;
//    }

//    return loginResponse;

  var a = parse(response, r"|$");
  print(a);
  }
}
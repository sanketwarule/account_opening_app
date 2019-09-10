import 'dart:io';

import 'package:account_opening_app/excpetions/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class WebClient{

  const WebClient();

  Future<dynamic> post(String url,
      [dynamic data]) async{
//    final response = await http.Client()
//        .post(url, body: data)
//        .timeout(const Duration(seconds: 30));

    String responseString;
    try {
      bool trustSelfSigned = true;
      HttpClient _httpClient = new HttpClient()
        ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
      IOClient ioClient = new IOClient(_httpClient);
       final response = await ioClient.post(url, body: data);
       print(
           "NetworkHandler {url : ${response.request.url} , data : $data , status : ${response.statusCode}}");
       responseString = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseString;
  }

  Future<dynamic> get(String url) async{
    final http.Response response = await http.Client().get(url);

    String responseString;
    try {
      bool trustSelfSigned = true;
      HttpClient _httpClient = new HttpClient()
        ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
      IOClient ioClient = new IOClient(_httpClient);
      final response = await ioClient.get(url);
      print(
          "NetworkHandler {url : ${response.request.url} , status : ${response.statusCode}}");
      responseString = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseString;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseString = response.body.toString();

        return responseString;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  } // _returnResponse closes here...
}
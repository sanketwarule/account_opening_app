import 'dart:io';
import 'package:account_opening_app/utils/utils.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'package:account_opening_app/utils/app_constants.dart';
import 'package:account_opening_app/excpetions/exceptions.dart';

class NetworkHandler {
  HttpClient _httpClient;

  Future<String> post(String endUrl, String data) async {
    // final networkBloc = BlocProvider.of<NetworkBloc>(context);
    String responseString;
    try {
      bool trustSelfSigned = true;
      _httpClient = new HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => trustSelfSigned);
      IOClient ioClient = new IOClient(_httpClient);
       final response = await ioClient.post(BASE_URL + endUrl, body: data);
       print(
           "NetworkHandler {url : ${response.request.url} , data : $data , status : ${response.statusCode} , response : ${response.body}");
       responseString = _returnResponse(response);
//       networkBloc.dispatch(Completed(responseData: responseString));
    } on SocketException {
      // networkBloc.dispatch(Error(message: responseString));
      throw FetchDataException('No Internet connection');
    }
    return responseString;
  } // post closes here...


  Future<String> get(String endUrl) async {
  // final networkBloc = BlocProvider.of<NetworkBloc>(context); 
    String responseString;
    try {
      bool trustSelfSigned = true;
      _httpClient = new HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => trustSelfSigned);
      IOClient ioClient = new IOClient(_httpClient);
      final response = await ioClient.get(TEST_URL + endUrl);
      print(
          "NetworkHandler {url : ${response.request.url} , status : ${response.statusCode}}");
      responseString = _returnResponse(response);
      // networkBloc.dispatch(Completed(responseData: responseString));
    } on SocketException {
      // networkBloc.dispatch(Error(message: responseString));
      throw FetchDataException('No Internet connection');
    }
    return responseString;
  } // get closes here...

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

} // NetworkHandler closes here...

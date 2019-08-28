import 'dart:io';
import 'package:account_opening_app/network/network_bloc.dart';
import 'package:account_opening_app/network/network_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'package:account_opening_app/excpetions/exceptions.dart';

class NetworkHandler {
  HttpClient _httpClient;

  execute(String endUrl, String data,context) async {
    final networkBloc = BlocProvider.of<NetworkBloc>(context);
    String responseString;
    try {
      bool trustSelfSigned = true;
      _httpClient = new HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => trustSelfSigned);
      IOClient ioClient = new IOClient(_httpClient);
      final response = await ioClient.post("http://www.mocky.io/v2/5d66a305330000eb74449e2e", body: data);
      print(
          "NetworkHandler {url : ${response.request.url} , data : $data , status : ${response.statusCode}}");
      responseString = _returnResponse(response);
      networkBloc.dispatch(Completed(responseData: responseString));
    } on SocketException {
      networkBloc.dispatch(Error(message: 'No Internet connection'));
      throw FetchDataException('No Internet connection');

    }

    return responseString;
  } // execute closes here...

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

import 'package:account_opening_app/network/network_listener.dart';
import 'package:account_opening_app/utils/app_constants.dart';
import 'package:dio/dio.dart';

class NetworkHandler{
NetworkListener _networkListener;
Dio dio = new Dio();

 execute(String urlQuery, String data) async{
try {
   await dio.post(BASE_URL + urlQuery,data: data).then((response){
print("NetworkHandler {url : ${response.request.baseUrl} , data : $data , status : ${response.statusCode}}");

if(response.statusCode == 200){
  _networkListener.onSuccess(response.data);
}else{
  print("error");
}
   });
}catch (e){
  _networkListener.onFailure(e);
}
}
// response = await dio.post(BASE_URL + urlQuery, data: {"id": 12, "name": "wendu"});

  setResponseListener(NetworkListener responseListener) {
    this._networkListener = responseListener;
  } //setResponseListener closes here.....
}
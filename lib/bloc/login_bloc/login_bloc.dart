import 'dart:async';
import 'package:account_opening_app/models/models.dart';
import 'package:account_opening_app/network/network_handler.dart';
import 'package:account_opening_app/utils/device_utils.dart' as deviceUtils;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../bloc.dart';
import 'package:account_opening_app/utils/app_constants.dart';
import 'package:account_opening_app/utils/device_utils.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

NetworkHandler _networkHandler;
BuildContext context;

LoginBloc(this.context){
  _networkHandler = NetworkHandler();
}
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login){
      yield LoginLoadingState();
      final user = await callLoginAPI(event);
      if(user == null){
        yield NotLoggedInState();
      }else{
        yield LoggedInState(user);
      }
    }
  }

  Future<User> callLoginAPI(Login event) async{

    String imei = await imeiCode();
    String deviceUsed = await deviceType();
    String appVersion = await appVersionName();
    print("imei : $imei , deviceUsed : $deviceUsed , appVersion : $appVersionName");


String data = "NTId="+event.username.toString().trim()
              +"&NTPass="+event.password.toString().trim()
              +"&IMEI="+imei
              + "&version="+appVersion.substring(0,3) // making 8.1.0 to 8.1
              +"&flag=L"
              +"&device="+deviceUsed
              +"&token=";                    // notification added from version 6.0          
        final response = await _networkHandler.execute(LOGIN_URL, data,context);
    return User(response);
  }

}

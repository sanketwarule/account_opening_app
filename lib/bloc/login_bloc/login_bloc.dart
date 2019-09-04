import 'dart:async';
import 'package:account_opening_app/repositories/logged_in_user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

 final LoggedInUserRepository _userRepository;


  LoginBloc({@required LoggedInUserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login){
      yield LoginLoadingState();
      // final user = await callLoginAPI(event);
      final userr = await _userRepository.signIn(event.username, event.password);
      if(userr == null){
        yield NotLoggedInState();
      }else{
        yield LoggedInState(userr);
      }
    }
  }

//   Future<User> callLoginAPI(Login event) async{

//     String imei = await imeiCode();
//     String deviceUsed = await deviceType();
//     String appVersion = await appVersionName();
//     print("imei : $imei , deviceUsed : $deviceUsed , appVersion : $appVersionName");


// String data = "NTId="+event.username.toString().trim()
//               +"&NTPass="+event.password.toString().trim()
//               +"&IMEI="+imei
//               + "&version="+appVersion.substring(0,3) // making 8.1.0 to 8.1
//               +"&flag=L"
//               +"&device="+deviceUsed
//               +"&token=";                    // notification added from version 6.0          
//         // final response = await _networkHandler.post(LOGIN_URL, data);
//     // return User(response);
//   }

}

import 'package:account_opening_app/models/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{
  AuthenticationEvent([List props = const []]) : super([props]);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LogIn extends AuthenticationEvent {
  final String userId;
  final String password;
  LogIn({@required String userId, @required String password})
      : assert(userId != null && password != null) ,
        userId = userId ,
        password = password,
        super([userId, password]);

  @override
  String toString() => 'LogIn { userId : $userId , password : $password}';
}

class LogOut extends AuthenticationEvent {
  final String userId;
  LogOut({@required String userId}) : assert(userId != null) , userId = userId , super([userId]);
  @override
  String toString() => 'LogOut { userId : $userId}';
}
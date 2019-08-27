import 'package:account_opening_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super(props);
}

class InitialLoginState extends LoginState {

  @override
  String toString() => "InitialLoginState";
}

class LoginLoadingState extends LoginState{

  @override
  String toString() => "LoginLoadingState";
}

class LoggedInState extends LoginState{
final User user;
LoggedInState(this.user) : super([user]);
  @override
  String toString() => "LoggedInState";
}

class NotLoggedInState extends LoginState{

  @override
  String toString() => "NotLoggedInState";
}

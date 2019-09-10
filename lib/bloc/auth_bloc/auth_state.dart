import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthenticationState extends Equatable{
  AuthenticationState([List props = const []]) : super([props]);
}

class InitialState extends AuthenticationState {
  @override
  String toString() => 'InitialState';
}

class AuthenticatedState extends AuthenticationState {

  @override
  String toString() => 'AuthenticatedState';
}

class UnAuthenticatedState extends AuthenticationState {
  @override
  String toString() => 'UnAuthenticatedState';
}
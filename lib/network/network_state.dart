import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class NetworkState extends Equatable {
  NetworkState([List props = const []]) : super([props]);
}

class InitialNetworkState extends NetworkState {
  @override
  String toString() => "InitialNetworkState";
}

class LoadingState extends NetworkState {
    @override
  String toString() => "LoadingState";
}

class OnSuccessState extends NetworkState {
  final String response;
  OnSuccessState({@required String response})
      : assert(response != null),
        this.response = response,
        super([response]);

  @override
  String toString() => "OnSuccessState { response : $response}";
}

class OnErrorState extends NetworkState {
  final String message;
  OnErrorState({@required String message})
      : assert(message != null),
        this.message = message,
        super([message]);

  String toString() => "OnErrorState { message : $message}";
}

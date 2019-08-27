import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NetworkEvent extends Equatable {
  NetworkEvent([List props = const []]) : super([props]);
}

class Loading extends NetworkEvent{
  @override
  String toString() => "Loading";
}

class Completed extends NetworkEvent {

final String responseData;
Completed({@required String responseData}) : assert (responseData != null),
this.responseData = responseData,
 super([responseData]);
 
  @override
  String toString() => "Completed {responseData : $responseData}";
}

class Error extends NetworkEvent {
final String message;
Error({@required String message}) : assert (message != null),
this.message = message,
 super([message]);
  @override
  String toString() => "Error {message : $message}";
}
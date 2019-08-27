class AppException implements Exception{
  final _message;
  final _prefix;
  
AppException([this._message, this._prefix]); // [] => optional constructor , {} => named constructor
  
@override
String toString() => "AppException {prefix : $_prefix , message : $_message}";

}
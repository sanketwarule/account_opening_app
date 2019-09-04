import 'package:account_opening_app/excpetions/exceptions.dart';

class RouteException extends AppException{
   RouteException([String message])
      : super(message, "Unknown Route ");
}
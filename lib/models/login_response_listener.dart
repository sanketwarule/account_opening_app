import 'package:account_opening_app/models/models.dart';

abstract class LoginResponseContract{
onLoginSuccess(User user);
onLoginFailure(String error);
}
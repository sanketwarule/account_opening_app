import 'package:account_opening_app/bloc/auth_bloc/auth.dart';
import 'package:account_opening_app/repositories/logged_in_user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState>{

  final UserRepository _userRepository;
  AuthBloc({@required UserRepository userRepository}) : assert (userRepository != null),_userRepository = userRepository;

  @override
  // TODO: implement initialState
  AuthenticationState get initialState => InitialState();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    // TODO: implement mapEventToState
    if (event is LogIn) {
      final user = await _userRepository.signIn(event.userId, event.password);
    }
  }

}
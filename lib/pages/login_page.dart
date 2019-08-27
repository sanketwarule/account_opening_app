import 'package:account_opening_app/bloc/bloc.dart';
import 'package:account_opening_app/utils/app_constants.dart';
import 'package:account_opening_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AccAppBar(title: APP_TITLE,),preferredSize: Size.fromHeight(55.0),),

      body: BlocProvider(
        builder: (BuildContext context) => LoginBloc(context),

        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is InitialLoginState){
              return LoginScreen();
            } 
            // else if (state is LoginLoadingState){
            //   // return ProgressBar();
            // }
            else if (state is LoggedInState){
              
              return loggedIn(state,context);
            }else if (state is NotLoggedInState){
              return errorScreen();
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }


 loggedIn(LoggedInState state, BuildContext context){

  //  return Navigator.push( new MaterialPageRoute(builder: (BuildContext builderContext) => HomePage(state.user.userName)));
    return Container(child: Center(child: Text("Logged in ${state.user.userName}")),);
  }

  Widget errorScreen() => Center(child: Text("Error while login"),);
}
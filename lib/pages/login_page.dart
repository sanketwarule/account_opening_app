import 'package:account_opening_app/bloc/bloc.dart';
import 'package:account_opening_app/pages/home_page.dart';
import 'package:account_opening_app/repositories/logged_in_user_repo.dart';
import 'package:account_opening_app/utils/app_constants.dart';
import 'package:account_opening_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AccAppBar(title: APP_TITLE,),preferredSize: Size.fromHeight(55.0),),

      body: BlocListener<NetworkBloc, NetworkState>(
      listener: (BuildContext context, state) {
        if(state is OnSuccessState){
          if(state.response.startsWith("0")){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage(state.response)));
          }else{
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.response),duration: Duration(seconds: 3),));
          }
        }else if (state is OnErrorState){ 
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message),duration: Duration(seconds: 3),));
        }
      },
      
      child: BlocProvider(
        builder: (BuildContext context) => LoginBloc(userRepository: LoggedInUserRepository()),

        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is InitialLoginState){
              return LoginScreen();
            } 
            else if (state is LoginLoadingState){
          
              return ProgressBar();
            }
           else if (state is NotLoggedInState){
              return errorScreen();
            }
            else if (state is LoggedInState){
              // here is my doubt....
              // from where should i dispatch the Loading, completed and error events of network bloc
              // instead of calling a HomePage widget, I have to navigate to HomePage
              return HomePage(state.user.userName);
            }
            return LoginScreen();
          },
        ),
      ), 
    ),
    );
  }

  Widget errorScreen() => Center(child: Text("Error while login"),);
}
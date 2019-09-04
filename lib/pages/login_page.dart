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
             else if (state is LoggedInState){

               // here I want to navigate to homepage instead of rendering the page inside the Login Page
               // How could I do this? Previously (Before adding the Repository) I was dispatching the Network Events from the NetworkHandler.. 
               // Now After uing the Repository I am confused that from where should I dispatch the events of networkbloc

               // You can modify this code... so I can able to understand
              
               return HomePage(state.user.userName);
             }
             else if (state is NotLoggedInState){
               return errorScreen();
             }
              return LoginScreen();
            }
          ),
        ),
      ), 
    );
  }


  Widget errorScreen() => Center(child: Text("Error while login"),);
}
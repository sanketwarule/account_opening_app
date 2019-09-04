import 'package:account_opening_app/bloc/bloc.dart';
import 'package:account_opening_app/pages/pages.dart';
import 'package:account_opening_app/simple_bloc_delegate.dart';
import 'package:flutter/material.dart';
import 'utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main(){
    BlocSupervisor.delegate = SimpleBlocDelegate();
runApp(AccApp());
} 

class AccApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider<NetworkBloc>(builder: (context) =>  NetworkBloc()),
        ],
      child: MaterialApp(

      title: APP_TITLE,
      home: LoginPage()

      ),
      
      
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       builder: (context) => DataBloc(),
//       child: MaterialApp(
//         home: Home(),
//       ),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: BlocListener<DataBloc, DataState>(
//         listener: (context, state) {
//           if (state is Success) {
//             Scaffold.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: Colors.green,
//                 content: Text('Success'),
//               ),
//             );
//           }
//         },
//         child: BlocBuilder<DataBloc, DataState>(
//           builder: (context, state) {
//             if (state is Initial) {
//               return Center(child: Text('Press the Button'));
//             }
//             if (state is Loading) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (state is Success) {
//               return Center(child: Text('Success'));
//             }
//           },
//         ),
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             child: Icon(Icons.play_arrow),
//             onPressed: () {
//               BlocProvider.of<DataBloc>(context).dispatch(FetchData());
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// @immutable
// abstract class DataEvent {}

// class FetchData extends DataEvent {}

// @immutable
// abstract class DataState {}

// class Initial extends DataState {}

// class Loading extends DataState {}

// class Success extends DataState {}

// class DataBloc extends Bloc<DataEvent, DataState> {
//   @override
//   DataState get initialState => Initial();

//   @override
//   Stream<DataState> mapEventToState(
//     DataEvent event,
//   ) async* {
//     if (event is FetchData) {
//       yield Loading();
//       await Future.delayed(Duration(seconds: 2));
//       yield Success();
//     }
//   }
// }
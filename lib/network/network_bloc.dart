import 'package:account_opening_app/network/network_event.dart';
import 'package:account_opening_app/network/network_state.dart';
import 'package:bloc/bloc.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState>{

  @override
  NetworkState get initialState => InitialNetworkState();

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async*{

    if(event is Completed){
      yield OnSuccessState(response: event.responseData);
    }else if(event is Error){
      yield OnErrorState(message: event.message);
    }else if (event is Loading){
      yield LoadingState();
    }
    yield InitialNetworkState();
  }

}
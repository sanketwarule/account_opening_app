import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
@immutable
abstract class DataEvent extends Equatable{
  DataEvent([List props = const []]): super(props);
}


class PostData extends DataEvent{
  
}
class FetchData extends DataEvent{

}
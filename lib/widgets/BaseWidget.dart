import 'package:account_opening_app/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseWidget<T extends Bloc<dynamic, S> , S extends NetworkState> extends StatefulWidget {

  final void Function(BuildContext context,S state) listener;
  final T bloc;
  final S state;
  final Widget child;
  BaseWidget({this.listener, this.bloc,this.state, this.child });
  @override
  _BaseWidgetState<T,S> createState() => _BaseWidgetState<T,S>();
}

class _BaseWidgetState<T extends Bloc<dynamic, S>, S extends NetworkState> extends State<BaseWidget<T,S>> {
  T bloc;
  @override
  void initState() {
    bloc = widget.bloc;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<T, S>(
      listener: widget.listener,
      child: widget.child,
      bloc: widget.bloc,
    );
  }
}

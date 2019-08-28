import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String data;
  HomePage(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        child: Center(child: Text(data??"NA"),)
      ),
    );
  }
}
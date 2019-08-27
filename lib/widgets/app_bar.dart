import 'package:account_opening_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class AccAppBar extends StatelessWidget {
  final String title;
  AccAppBar({@required String title}) : assert (title != null), this.title = title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(APP_TITLE),
    );
  }
}
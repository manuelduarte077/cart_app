import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Exception? error;
  late final String message;

  ErrorPage({Key? key, this.error}) : super(key: key) {
    if (error != null) {
      message = error.toString();
    } else {
      message = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(message)));
  }
}

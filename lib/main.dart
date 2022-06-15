import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';

import 'login_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final state = LoginState(await SharedPreferences.getInstance());
  state.checkLoggedIn();
  runApp(
    MyApp(loginState: state),
  );
}

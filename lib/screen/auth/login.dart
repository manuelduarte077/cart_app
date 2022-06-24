import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../../login_state.dart';
import '../../style/theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              ),
              radius: 100,
            ),
            TextFieldEmail(emailTextController: emailTextController),
            TextFieldPassword(passwordTextController: passwordTextController),
            const ButtonAuth()
          ],
        ),
      ),
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    Key? key,
    required this.emailTextController,
  }) : super(key: key);

  final TextEditingController emailTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 50.0, left: 35.0, right: 35.0, bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Email',
              ),
              controller: emailTextController,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    Key? key,
    required this.passwordTextController,
  }) : super(key: key);

  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35.0, bottom: 50),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Password',
              ),
              controller: passwordTextController,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 26,
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: const BorderSide(
                    color: ColorsApp.background,
                  ),
                ),
              ),
            ),
            onPressed: () {
              context.goNamed(createAccountRouteName);
            },
            child: const Text(
              'Create Account',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          width: 26,
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: const BorderSide(color: ColorsApp.background),
                ),
              ),
            ),
            onPressed: () {
              saveLoginState(context);
            },
            child: const Text('Login'),
          ),
        ),
        const SizedBox(
          width: 26,
        ),
      ],
    );
  }

  void saveLoginState(BuildContext context) {
    Provider.of<LoginState>(context, listen: false).loggedIn = true;
  }
}

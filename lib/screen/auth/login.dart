import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../../login_state.dart';

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
                icon: Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                hintText: 'Email',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding,
                ),
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
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding,
                ),
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
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    color: kPrimaryLightColor,
                  ),
                ),
              ),
            ),
            onPressed: () {
              context.goNamed(createAccountRouteName);
            },
            child: const Text(
              'Create Account',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(
          width: 26,
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: kPrimaryLightColor),
                ),
              ),
            ),
            onPressed: () {
              saveLoginState(context);
            },
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 16),
            ),
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

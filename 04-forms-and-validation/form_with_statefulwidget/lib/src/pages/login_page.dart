import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        20.0,
      ),
      child: Form(
        child: Column(
          children: [
            emailField(),
            passwordField(),
            const SizedBox(
              height: 20,
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: const InputDecoration(
        labelText: 'Email',
        icon: Icon(Icons.email_rounded),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.password_outlined),
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: const ButtonStyle(
        shadowColor: WidgetStatePropertyAll<Color>(Colors.green),
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.white70),
      ),
      onPressed: () {},
      child: const Text('Submit'),
    );
  }
}

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          SizedBox(
            height: 25,
          ),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'you@example.com', labelText: 'Email Adress'),
    );
  }

  Widget passwordField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
    );
  }

  submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Login'),
    );
  }
}

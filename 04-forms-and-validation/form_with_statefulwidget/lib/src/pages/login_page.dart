import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        20.0,
      ),
      child: Form(
        key: formKey,
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
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Password cannot be empty';
        }
        if (!value!.contains('@')) {
          return 'Please enter a valid email!';
        }
        return null;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.password_outlined),
      ),
      validator: (String? value) {
        if (value?.isEmpty ?? true) {
          return 'Password cannot be empty';
        }
        if (value!.length < 4) {
          return 'Password must be at least 4 characters';
        }
        return null;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: const ButtonStyle(
        shadowColor: WidgetStatePropertyAll<Color>(Colors.green),
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.white70),
      ),
      onPressed: () {
        formKey.currentState?.validate();
      },
      child: const Text('Submit'),
    );
  }
}

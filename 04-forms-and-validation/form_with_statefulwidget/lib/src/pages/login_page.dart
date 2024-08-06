import 'package:flutter/material.dart';
import 'package:form_with_statefulwidget/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
      validator: validateEmail,
      onSaved: (newValue) {
        email = newValue!;
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
      validator: validatePassword,
      onSaved: (newValue) {
        password = newValue!;
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
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
        }
      },
      child: const Text('Submit'),
    );
  }
}

import 'package:flutter/material.dart';
import 'pages/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Log Me in!',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

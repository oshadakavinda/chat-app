import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Text(
          'Login Page',
          style: Theme.of(context).textTheme.headlineMedium, // Updated to headlineMedium
        ),
      ),
    );
  }
}
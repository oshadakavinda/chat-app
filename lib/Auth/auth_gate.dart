import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_application_1/Auth/login_or_register_page.dart";
import "package:flutter_application_1/pages/home_page.dart";

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // check logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          // check if not
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/auth_service.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // on tap navigate to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login function
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // login
    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    }

    // catch errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 50),

              //welcome back message
              Text(
                "Welcome back!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              //email textfield
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),

              const SizedBox(height: 10),
              // pw textfield
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),

              //login button
              MyButton(
                text: "Login",
                onTap: () => login(context),
              ),

              //register button

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("Register now!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:week_5/presentation/Screens/Login/widget/loginForm.dart';

class LoginScree extends StatelessWidget {
  const LoginScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(),
    );
  }
}

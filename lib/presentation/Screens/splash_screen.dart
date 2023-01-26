import 'package:flutter/material.dart';
import 'Login/widget/loginForm.dart';
import 'Splash/splash widgets/spalsh_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splash(context);
    return const Scaffold(
      body: Logo(),
    );
  }

// checking passwords
  splash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (contxt) => LoginForm(),
        ));
  }
}

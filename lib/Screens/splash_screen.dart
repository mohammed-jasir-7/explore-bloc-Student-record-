import 'package:flutter/material.dart';


import 'package:week_5/Screens/Login/widget/loginForm.dart';
import 'package:week_5/Screens/Splash/splash%20widgets/spalsh_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splash(context);
    return Scaffold(
      body: Logo(),
    );
  }

// checking passwords
  splash(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (contxt) => LoginForm(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week_5/Database/db_functions.dart';
import 'package:week_5/Model/users.dart';
import 'package:week_5/Screens/Home/home_screen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  static late Users logindUser;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber,
      child: Container(
        color: Color.fromARGB(255, 50, 50, 50),
        child: SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Text(
                      'Login',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextFormField(
                    style: GoogleFonts.montserrat(color: Colors.white),
                    controller: username,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "UserName",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: GoogleFonts.montserrat(color: Colors.white),
                    controller: password,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "password",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        validateData(context);
                      },
                      child: Text("login"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validateData(BuildContext context) {
    final obj = DBFunctions();
    obj.addUser();
    logindUser = obj.usersLists.firstWhere((element) =>
        element.userName == username.text && element.password == password.text);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(username: username.text),
        ),
        (route) => false);

    // if (username.text == obj.usersLists[0].userName &&
    //     password.text == obj.usersLists[0].password) {
    //   print(obj.user.password);
    // }
  }
}

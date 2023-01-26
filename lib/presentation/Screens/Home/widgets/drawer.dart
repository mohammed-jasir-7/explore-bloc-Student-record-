import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../Login/widget/loginForm.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 200,
        color: const Color.fromARGB(255, 57, 57, 57),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(LoginForm.logindUser.image)),
              ),
            ),
            Text(
              LoginForm.logindUser.userName,
              style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Divider(
              color: Colors.white,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginForm(),
                    ),
                    (route) => false);
              },
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  "Log out",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                "settings",
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

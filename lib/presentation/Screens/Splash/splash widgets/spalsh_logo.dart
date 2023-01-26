import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BRO",
              style: GoogleFonts.montserrat(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  backgroundColor: Colors.black),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "TOTYPE",
              style: GoogleFonts.montserrat(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'brother you never had',
              style: GoogleFonts.montserrat(fontSize: 20),
            )
          ],
        )
      ],
    );
  }
}

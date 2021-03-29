import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatelessWidget {
  final String mathsLogo = 'assets/undraw_maths.svg';

  // final Widget svg = SvgPicture.asset(
  //   mathsLogo,
  //   semanticsLabel: 'Maths Logo'
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 40, 8, 40),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Maths App',
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200]
                    )
                  ),
                  Text(
                    'by Herbie',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200]
                    )
                  ),
                  Spacer(),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    color: Colors.grey[200],
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: Text(
                          'Start',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]
                          )
                        )
                      )
                    ),
                  )
                ],
              ),
            )
          ),
        )
      )
    );
  }
}

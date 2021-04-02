import 'package:app/components/page_navigator.dart';
import 'package:app/services/score.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'start.dart';
import 'package:provider/provider.dart';
import '../components/wrapper.dart';

class Results extends StatelessWidget {
  final String astronauntLogo = 'https://42f2671d685f51e10fc6-b9fcecea3e50b3b59bdc28dead054ebc.ssl.cf5.rackcdn.com/illustrations/Astronaut_re_8c33.svg';

  @override
  Widget build(BuildContext context) {
    final int score = context.watch<ScoreHandler>().score;
    final String msg = score == 0 
      ? 'Terrible' 
      : score == 1 
        ? 'Could do better' 
        : score == 2 
          ? 'Good job' 
          : 'Perfect';

    return Scaffold(
      body: Wrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Final results',
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200]
              )
            ),
            Text(
              'You scored $score out of 3! $msg!',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200]
              )
            ),
            Spacer(),
            SvgPicture.network(
              astronauntLogo,
              placeholderBuilder: (context) => CircularProgressIndicator(),
              height: 200,
            ),
            Spacer(),
            GestureDetector(
              onTap: () => navigate(context, Start()),
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Text(
                      'Start again',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]
                      )
                    )
                  )
                ),
              )
            )
          ],
        ),
      )
    );
  }
}

import 'package:app/components/page_navigator.dart';
import 'package:app/services/data.dart';
import 'package:app/services/score.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'start.dart';
import 'package:provider/provider.dart';
import '../components/wrapper.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  final String astronauntLogo = 'https://42f2671d685f51e10fc6-b9fcecea3e50b3b59bdc28dead054ebc.ssl.cf5.rackcdn.com/illustrations/Astronaut_re_8c33.svg';

  @override initState() {
    context.read<DataHandler>()?.loadQuestions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int score = context.watch<ScoreHandler>().score;
    String msg;

    if (score <= 9) {
      msg = 'Terrible';
    } else if (score <= 19) {
      msg = 'Could do better';
    } else if (score <= 29) {
      msg = 'Good job';
    } else {
      msg = 'Perfect';
    }

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
              'You scored $score out of 30! $msg!',
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

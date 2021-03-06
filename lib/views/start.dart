import 'package:app/components/page_navigator.dart';
import 'package:app/services/data.dart';
import 'package:app/services/score.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'level_1.dart';
import '../components/wrapper.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final String mathsLogo = 'https://42f2671d685f51e10fc6-b9fcecea3e50b3b59bdc28dead054ebc.ssl.cf5.rackcdn.com/illustrations/mathematics_4otb.svg';

  @override
  void didChangeDependencies() {
    context.read<ScoreHandler>()?.initScore();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<DataHandler>().questions == null;

    return Scaffold(
      body: Wrapper(
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
            SvgPicture.network(
              mathsLogo,
              placeholderBuilder: (context) => CircularProgressIndicator(),
              height: 200,
            ),
            Spacer(),
            isLoading 
              ? Container(
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
                        'Loading quiz',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]
                        )
                      )
                    )
                  ),
                ) 
              : GestureDetector(
                onTap: () => navigate(context, Level1()),
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
            )
          ],
        ),
      )
    );
  }
}

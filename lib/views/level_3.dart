import 'package:app/components/page_navigator.dart';
import 'package:app/components/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/wrapper.dart';
import 'results.dart';

class Level3 extends StatefulWidget {
  Level3({Key key}) : super(key: key);

  @override
  _Level3 createState() => _Level3();
}

class _Level3 extends State<Level3> {
  @override
  void initState() {
    super.initState();
  }

  void _verifyAnswer(ctx) {
    navigate(ctx, Results());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Level 3',
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200]
              )
            ),
            Text(
              'Question: What is 4 + 9?',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200]
              )
            ),
            ProgressBar(begin: 200 / 3 + 200 / 3, end: 200),
            Spacer(),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
            Spacer(),
            GestureDetector(
              onTap: () => _verifyAnswer(context),
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
                      'Verify answer',
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
        )
      )
    );
  }
}


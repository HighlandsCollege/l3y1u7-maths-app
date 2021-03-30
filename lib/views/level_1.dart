import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/wrapper.dart';
import 'level_2.dart';

class Level1 extends StatefulWidget {
  Level1({Key key}) : super(key: key);

  @override
  _Level1 createState() => _Level1();
}

class _Level1 extends State<Level1> {
  @override
  void initState() {
    super.initState();
  }

  void _verifyAnswer(ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (ctx) => Level2()
      )
    );
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
              'Level 1',
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
            Container(
              width: 200,
              child: Row(
                children: [
                  Container(
                    height: 10,
                    width: 200 / 3,
                    decoration: BoxDecoration(
                      color: Colors.,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  )
                ],
              )
            ),
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

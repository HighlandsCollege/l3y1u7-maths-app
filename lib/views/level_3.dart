import 'package:app/components/timer.dart';
import 'package:app/models/data_model.dart';
import 'package:app/services/score.dart';
import 'package:app/utils/shuffle.dart';
import 'package:app/views/failed.dart';
import '../components/page_navigator.dart';
import '../services/data.dart';
import 'package:provider/provider.dart';
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
  String key;
  List<Tion> tion;
  List<int> shuffled;
  int selectedNumber;
  int questionNumber = 20;
  int timer = 10;

  @override
  void didChangeDependencies() {
    var state = context.watch<DataHandler>();

    if (state.questions != null) {
      tion = state.questions;
      shuffled = shuffle([
        tion[questionNumber].answer,
        ...tion[questionNumber].buffer
      ]);
    }

    super.didChangeDependencies();
  }
  
  void _verifyAnswer(BuildContext ctx, int number) {
    if (tion[questionNumber].answer == number) {
      ctx.read<ScoreHandler>().increment();
    }

    if (questionNumber == 29) {
      navigate(ctx, Results());
    } else {
      setState(() {
        timer = 20;
        selectedNumber = null;
        questionNumber++;
        shuffled = shuffle([
          tion[questionNumber].answer,
          ...tion[questionNumber].buffer
        ]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Wrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Level 3 - Question ${questionNumber + 1}',
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200]
              )
            ),
            Text(
              '${tion[questionNumber].question}',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200]
              )
            ),
            TimerProgress(
              time: timer,
              onCompleted: () => navigate(context, Failed()),  
            ),
            Spacer(),
            Container(
              height: size.width,
              width: size.width,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(4, (index) => 
                  Center(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        selectedNumber = shuffled[index];
                      }),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: selectedNumber == shuffled[index] ? Color(0xff6C63FF) : Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10)
                          )
                        ),
                        child: Center(
                          child: Text(
                            '${shuffled[index]}',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: selectedNumber == shuffled[index] ? Colors.grey[200] : Colors.grey[800]
                            )
                          )
                        ),
                      ),
                    ),
                  )
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => selectedNumber != null 
                ? _verifyAnswer(context, selectedNumber) 
                : null,
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: selectedNumber == null ? Colors.grey[500] : Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Text(
                      questionNumber == 9 ? 'Next level' : 'Next question',
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

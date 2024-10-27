import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/buttons/quiz_button.dart';

class ResultsScreen extends StatelessWidget{

  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String,Object>> getSummeryData(){

    final List<Map<String,Object>> summary = [];

    for (var i = 0; i <= chosenAnswers.length; i++){
      summary.add({

      });
    }

    return summary;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
                'You answered X out of Y questions correctly!',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text('List of answers and questions'),
            const SizedBox(height: 30),
            QuizButton(
                buttonText: 'Restart Quiz',
                onClick: () {},
                buttonIcon: const Icon(Icons.restart_alt),
            )
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/buttons/quiz_button.dart';
import 'package:quiz_app/widgets/summary_widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget{

  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart
  });

  final List<String> chosenAnswers;

  final void Function() onRestart;

  //Example of a getter
  List<Map<String,Object>> get summaryDataGetter {
    final List<Map<String,Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  List<Map<String,Object>> getSummeryData(){

    final List<Map<String,Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }


  @override
  Widget build(BuildContext context) {
    final summaryData = getSummeryData();

    final totalQuestions = questions.length;

    //Arrow function example
    final correctQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
                'You answered $correctQuestions out of $totalQuestions questions correctly!',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            QuizButton(
                buttonText: 'Restart Quiz',
                onClick: onRestart,
                buttonIcon: const Icon(Icons.restart_alt),
            )
          ],
        ),
      )
    );
  }
}
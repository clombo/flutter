import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/buttons/quiz_button.dart';
import 'package:quiz_app/data/questions.dart';


class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  //Function passed in from quiz_app main window manager
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;


  void answerQuestion(String selectedAnswer){
    //Get access to the onSelectAnswer method in widget
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(width: double.infinity, child:
        Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(currentQuestion.text,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                ),
                //... is the spread operator to spread what is being returned into comma separated widgets
                ...currentQuestion.getShuffled().map((item) => [
                  const SizedBox(height: 10),
                  QuizButton(buttonText: item, onClick: () {
                    //Call answerQuestion via anonymous function since it is not a pointer anymore
                    answerQuestion(item);
                  })
                ]).expand((widgetList) => widgetList) //Flatten the list of lists with expand
              ]
              ,)
        )
      ,);
  }

}
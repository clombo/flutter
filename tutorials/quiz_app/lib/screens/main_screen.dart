import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/buttons/quiz_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png',width: 300),
            const SizedBox(height: 40),
            Text(
              "Learn Flutter the fun way!",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 28
              ),
            ),
            const SizedBox(height: 25),
            QuizButton(
                buttonText: 'Start Quiz',
                onClick: startQuiz,buttonIcon:
                const Icon(Icons.arrow_right_alt)
            ),
          ],
        ),
    );
  }
}
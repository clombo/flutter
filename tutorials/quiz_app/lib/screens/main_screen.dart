import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
            ElevatedButton.icon(
                onPressed: startQuiz,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: Text(
                  'Start Quiz',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold
                  ),
                )
            ),
          ],
        ),
    );
  }
}